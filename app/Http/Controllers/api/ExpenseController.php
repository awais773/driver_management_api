<?php

namespace App\Http\Controllers\api;

use App\Models\Bolt;
use App\Models\Invoice;
use App\Models\Uber;
use App\Models\User;
use App\Models\Expense;
use App\Models\Service;
use App\Models\Vehicle;
use App\Models\ImportFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use SebastianBergmann\CodeCoverage\Driver\Driver;

class ExpenseController extends Controller
{


    public function index()
    {
        $data = Expense::with('driver.company')->select(
            'user_id',
            DB::raw('SUM(CASE WHEN card = "Payable" AND status = "Approved" THEN amount ELSE 0 END) as total_payable'),
            DB::raw('SUM(CASE WHEN card = "Receivable" AND status = "Approved" THEN amount ELSE 0 END) as total_receivable'),
            DB::raw('SUM(CASE WHEN status = "Pending" THEN 1 ELSE 0 END) as total_pending')
        )
            ->groupBy('user_id')
            ->get();

        if ($data->isEmpty()) {
            return response()->json('data not found');
        }

        return response()->json([
            'success' => true,
            'message' => 'Data retrieved successfully',
            'data' => $data,
        ]);
    }

    public function paymentShow(Request $request, $id)
    {
        $data = Expense::with('driver')->select(
            'user_id', 
            DB::raw('SUM(CASE WHEN card = "Payable" AND status = "Approved" THEN amount ELSE 0 END) as total_payable'),
            DB::raw('SUM(CASE WHEN card = "Receivable" AND status = "Approved" THEN amount ELSE 0 END) as total_receivable'),
            DB::raw('SUM(CASE WHEN status = "Pending" THEN 1 ELSE 0 END) as total_pending')
        )
            ->where('user_id', $id) // Filter by the provided $id
            ->groupBy('user_id')
            ->first();
    
        if (!$data) {
            return response()->json(['message' => 'Data not found for the provided ID'], 404);
        }  
        return response()->json([
            'success' => true,
            'message' => 'Data retrieved successfully',
            'data' => $data,
        ]);
    }


    
    public function reportAdd(Request $request)
    {        
        $Expense = Invoice::create([
            'user_id' =>$request->user_id,
            'deduct_from_salary' => $request->deduct_from_salary,
            'total_payable_exclusive_tex' => $request->total_payable_exclusive_tex,
            'total_payable' => $request->total_payable,
            'total_receivable' => $request->total_receivable,
            'remaining_reciveable' => $request->remaining_reciveable,
            'tax' => $request->tax,
            'total_inclusive_tex' => $request->total_inclusive_tex,

        ]);  
        $Expense->save();    
  
    $obj = Expense::find($request->user_id);
      if ($obj) {
         if (!empty($request->input('remaining_reciveable'))) {
             $obj->remaining_reciveable = $request->input('remaining_reciveable');
         }
          $obj->save();

     }  
  
        return response()->json([
            'success' => true,
            'message' => 'Data retrieved successfully',
            'data' => $Expense,
        ]);
    }
    

    public function B2BIndex()
    {
        $data = Expense::where('type', 'b2b')->get();
        //  foreach ($data as $Expense) {
        //     $Expense->vehicle_image = json_decode($Expense->vehicle_image); // Decode the JSON-encoded location string
        // }
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }


    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'email' => 'required|string|email|max:255|unique:users',
        ]);
    
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Email already exists',
            ], 400);
        } else {    

            $Expense = Expense::create([
                'user_id' => $request->user_id,
                'amount' => $request->amount,
                'category' => $request->category,
                'card' => $request->card,
                'status' => 'Pending',
            ]);            
            if ($file = $request->file('image')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'expenseImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $Expense->image = $video_url;
            }
            $Expense->save();    
            // $vehicleId = User::where('id', $request->user_id)->value('vehicle_id');
            // if (is_null($vehicleId)) {
            //     return response()->json('Driver does not have a vehicle assigned');
            // }
            // $vehicle = Vehicle::find($vehicleId);    
            // if ($vehicle) {
            //     if (!empty($request->input('service_meter_reading'))) {
            //         $vehicle->service_meter_reading = $request->input('service_meter_reading');
            //     }
            //     if (!empty($request->input('total_life_kilometer'))) {
            //         $vehicle->total_life_kilometer = $request->input('total_life_kilometer');
            //     }
            //     $vehicle->save();
            // }
    
            return response()->json([
                'success' => true,
                'message' => 'Expense created successfully',
                'data'  => $Expense,
            ], 200);
        }
    }
    


    // public function store(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         // 'email' => 'required|string|email|max:255|unique:users',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'success' => false,
    //             // 'message' => $validator->errors()->toJson()
    //             'message' => 'Email already exist',

    //         ], 400);
    //     } {
    //         $Expense = Expense::create($request->post());
    //         if ($file = $request->file('image')) {
    //             $video_name = md5(rand(1000, 10000));
    //             $ext = strtolower($file->getClientOriginalExtension());
    //             $video_full_name = $video_name . '.' . $ext;
    //             $upload_path = 'expenseImage/';
    //             $video_url = $upload_path . $video_full_name;
    //             $file->move($upload_path, $video_url);
    //             $Expense->image = $video_url;
    //         }
    //         $Expense->save();
    //         $vehicleId = User::where('id', $request->user_id)->value('vehicle_id');
    //         if (is_null($vehicleId)) {
    //             return response()->json('Driver does not have a vehicle assigned');
    //         }
    //         return response()->json([
    //             'success' => true,
    //             'message' => 'Expense Create successfull',
    //             'data'  => $Expense,
    //         ], 200);
    //     }
    //         // Check if the driver has a vehicle assigned
    //         $obj = Vehicle::find($vehicleId);
    //         if ($obj) {
    //            if (!empty($request->input('service_meter_reading'))) {
    //                $obj->service_meter_reading = $request->input('service_meter_reading');
    //            }
    //            if (!empty($request->input('total_life_kilometer'))) {
    //             $obj->total_life_kilometer = $request->input('total_life_kilometer');
    //         }
    //             $obj->save();
      
    //        }

    // }

    public function show($id)
    {
        $program = Expense::with('driver')->where('id', $id)->first();
        // $program->vehicle_image = json_decode($program->vehicle_image); // Decode the JSON-encoded location string
        if (is_null($program)) {
            return response()->json('Data not found', 404);
        }
        return response()->json([
            'success' => true,
            'data' => $program,
        ]);
    }


    public function update(Request $request, $id)
    {

        $obj = Expense::find($id);
        if ($obj) {
            if (!empty($request->input('category'))) {
                $obj->category = $request->input('category');
            }
            if (!empty($request->input('amount'))) {
                $obj->amount = $request->input('amount');
            }
            if (!empty($request->input('user_id'))) {
                $obj->user_id = $request->input('user_id');
            }
            if (!empty($request->input('status'))) {
                $obj->status = $request->input('status');
            }
            if (!empty($request->input('card'))) {
                $obj->card = $request->input('card');
            }
           if (!empty($request->input('comment'))) {
                $obj->comment = $request->input('comment');
            }
            if (!empty($request->input('amount_type'))) {
                $obj->amount_type = $request->input('amount_type');
            }

            if ($file = $request->file('image')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'expenseImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $obj->image = $video_url;
            }
            $obj->save();
        }
        return response()->json([
            'success' => true,
            'message' => 'Expense is updated successfully',
            'data' => $obj,
        ]);
    }


    public function destroy($id)
    {
        $program = Expense::find($id);
        if (!empty($program)) {
            $program->delete();
            return response()->json([
                'success' => true,
                'message' => ' delete successfuly',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'something wrong try again ',
            ]);
        }
    }



    public function detailsExpensive($id)
    {
        $data = Expense::with('driver')->where('user_id', $id)->get();
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }



    public function VehicleExpense($id)
{
    // Retrieve the driver's vehicle_id
    $vehicleId = User::where('id', $id)->value('vehicle_id');

    // Check if the driver has a vehicle assigned
    if (is_null($vehicleId)) {
        return response()->json('Driver does not have a vehicle assigned');
    }

    // Retrieve services based on the driver's vehicle_id
    $services = Service:: with('vehicle')->where('vehicle_id', $vehicleId)->get();

    if ($services->isEmpty()) {
        return response()->json('No services found for the driver\'s vehicle');
    }

    return response()->json([
        'success' => true,
        'message' => 'Services successfully retrieved for the driver\'s vehicle',
        'data' => $services,
    ]);
}




    //     public function indexDriver()
    // {
    //     $data = Expense::with('driver')
    //         ->whereIn('id', function ($query) {
    //             $query->selectRaw('MAX(id)')
    //                 ->from('expenses')
    //                 ->groupBy('driver_id');
    //         })
    //         ->get();

    //     if ($data->isEmpty()) {
    //         return response()->json('data not found');
    //     }

    //     return response()->json([
    //         'success' => true,
    //         'message' => 'All Data successful',
    //         'data' => $data,
    //     ]);
    // }


    // public function processCSV(Request $request)
    // {
    //     $request->validate([
    //         'csv_file' => 'required|mimes:csv,txt',
    //     ]);

    //     $csvFilePath = $request->file('csv_file')->getPathName();
    //     // Assuming the CSV columns are: username, last_name, and any other relevant fields
    //     $csvData = array_map('str_getcsv', file($csvFilePath));

    //     foreach ($csvData as $data) {
    //         $username = $data[0];
    //         $last_name = $data[1];
    //         $amount = $data[2]; // Assuming the amount is in the third column
    //         // Extract other fields from $data array

    //         // Find and update the user
    //            DB::table('users')
    //             ->where('name', $username)
    //             ->where('last_name', $last_name)
    //             // i want the amount to be added to the existing amount
    //             ->update([
    //                 'uber_earning' => $amount,
    //             ]);
    //     }
    //     $driver = new ImportFile(); 
    //     if ($file = $request->file('csv_file')) {
    //         $video_name = md5(rand(1000, 10000));
    //         $ext = strtolower($file->getClientOriginalExtension());
    //         $video_full_name = $video_name . '.' . $ext;
    //         $upload_path = 'ImportFile/';
    //         $video_url = $upload_path . $video_full_name;
    //         $file->move($upload_path, $video_url);
    //         $driver->file = $video_url;
    //     }
    //     $driver->save();

    //     return response()->json(['message' => 'User records updated successfully']);
    // }



    // public function processCSV(Request $request)
    // {
    //     $request->validate([
    //         'csv_file' => 'required|mimes:csv,txt',
    //     ]);

    //     $csvFilePath = $request->file('csv_file')->getPathName();
    //     // Assuming the CSV columns are: username, last_name, and any other relevant fields
    //     $csvData = array_map('str_getcsv', file($csvFilePath));

    //     foreach ($csvData as $data) {
    //         $username = $data[0];
    //         $last_name = $data[1];
    //         $amount = $data[2]; // Assuming the amount is in the third column
    //         // Extract other fields from $data array

    //         // Retrieve the current 'uber_earning' value for the user
    //         $user = DB::table('users')
    //             ->where('name', $username)
    //             ->where('last_name', $last_name)
    //             ->first();

    //         if ($user) {
    //             $currentUberEarning = $user->uber_earning;
    //             // Calculate the new 'uber_earning' value by adding the new amount
    //             $newUberEarning = $currentUberEarning + $amount;

    //             // Update the user's 'uber_earning' with the new value
    //             DB::table('users')
    //                 ->where('name', $username)
    //                 ->where('last_name', $last_name)
    //                 ->update([
    //                     'uber_earning' => $newUberEarning,
    //                 ]);
    //         }
    //     }

    //     $driver = new ImportFile(); 
    //     if ($file = $request->file('csv_file')) {
    //         $video_name = md5(rand(1000, 10000));
    //         $ext = strtolower($file->getClientOriginalExtension());
    //         $video_full_name = $video_name . '.' . $ext;
    //         $upload_path = 'ImportFile/';
    //         $video_url = $upload_path . $video_full_name;
    //         $file->move($upload_path, $video_url);
    //         $driver->file = $video_url;
    //     }
    //     $driver->save();

    //     return response()->json(['message' => 'User records updated successfully']);
    // }
    // public function processCSV(Request $request)
    // {
    //     $request->validate([
    //         'csv_file' => 'required|mimes:csv,txt',
    //         'type' => 'required|in:bolt,uber', // Add validation for the "type" parameter
    //     ]);

    //     $type = $request->input('type'); // Get the "type" from the request

    //     $csvFilePath = $request->file('csv_file')->getPathName();
    //     // Assuming the CSV columns are: username, last_name, amount, and any other relevant fields
    //     $csvData = array_map('str_getcsv', file($csvFilePath));

    //     foreach ($csvData as $data) {
    //         $username = $data[0];
    //         $last_name = $data[1];
    //         $amount = $data[2]; // Assuming the amount is in the third column

    //         // Extract other fields from $data array

    //         // Retrieve the user based on their username and last_name
    //         $user = DB::table('users')
    //             ->where('name', $username)
    //             ->where('last_name', $last_name)
    //             ->where('type', $type)
    //             ->first();

    //         if ($user) {
    //             // Depending on the "type" from the request, update the corresponding field
    //             if ($type === 'bolt') {
    //                 $currentB2BEarning = $user->bolt_earning;
    //                 // Calculate the new 'b2b_earning' value by adding the new amount
    //                 $newB2BEarning = $currentB2BEarning + $amount;
    //                 // Update the user's 'b2b_earning' with the new value
    //                 DB::table('users')
    //                     ->where('name', $username)
    //                     ->where('last_name', $last_name)
    //                     ->update([
    //                         'bolt_earning' => $newB2BEarning,
    //                     ]);

    //                 DB::table('bolts')
    //                     ->insert([
    //                         'name' => $username,
    //                         'last_name' => $last_name,
    //                         'bolt_earning' => $amount,
    //                     ]);
    //             } elseif ($type === 'uber') {
    //                 $currentDriverEarning = $user->uber_earning;
    //                 // Calculate the new 'driver_earning' value by adding the new amount
    //                 $newDriverEarning = $currentDriverEarning + $amount;

    //                 // Update the user's 'driver_earning' with the new value
    //                 DB::table('users')
    //                     ->where('name', $username)
    //                     ->where('last_name', $last_name)
    //                     ->update([
    //                         'uber_earning' => $newDriverEarning,
    //                     ]);
    //                 // i want the add the name and last name add in the table
    //                 DB::table('ubers')
    //                     ->insert([
    //                         'name' => $username,
    //                         'last_name' => $last_name,
    //                         'uber_earning' => $amount,
    //                     ]);
    //             }
    //             // Add more conditions for other "type" values if needed
    //         }
    //     }

    //     $driver = new ImportFile();
    //     if ($file = $request->file('csv_file')) {
    //         $video_name = md5(rand(1000, 10000));
    //         $ext = strtolower($file->getClientOriginalExtension());
    //         $video_full_name = $video_name . '.' . $ext;
    //         $upload_path = 'ImportFile/';
    //         $video_url = $upload_path . $video_full_name;
    //         $file->move($upload_path, $video_url);
    //         $driver->file = $video_url;
    //     }
    //     $driver->save();

    //     return response()->json(['message' => 'User records updated successfully']);
    // }

    public function processCSV(Request $request)
{
    $request->validate([
        'csv_file' => 'required|mimes:csv,txt',
        'type' => 'required|in:bolt,uber', // Add validation for the "type" parameter
    ]);

    $type = $request->input('type'); // Get the "type" from the request

    $csvFilePath = $request->file('csv_file')->getPathName();
    // Assuming the CSV columns are: username, last_name, amount, and any other relevant fields
    $csvData = array_map('str_getcsv', file($csvFilePath));

    foreach ($csvData as $data) {
        $username = $data[0];
        $last_name = $data[1];
        $amount = $data[2]; // Assuming the amount is in the third column

        // Extract other fields from $data array

        // Retrieve the user based on their username, last_name, and type
        $user = DB::table('users')
            ->where('name', $username)
            ->where('last_name', $last_name)
            ->where('type', $type)
            ->first();

        if ($user) {
            // Depending on the "type" from the request, update the corresponding field
            if ($type === 'bolt') {
                $currentBoltEarning = $user->bolt_earning;
                // Calculate the new 'bolt_earning' value by adding the new amount
                $newBoltEarning = $currentBoltEarning + $amount;

                // Update the user's 'bolt_earning' with the new value
                DB::table('users')
                    ->where('name', $username)
                    ->where('last_name', $last_name)
                    ->update([
                        'bolt_earning' => $newBoltEarning,
                    ]);

                // Insert the record into the "bolts" table
              
                DB::table('ubers')->insert([
                    'name' => $username,  
                    'last_name' => $last_name,
                    'bolt_earning' => $amount,
                    'total' => $amount,
                    'moms_6_tax' => $amount * 0.06,
                    'net' => $amount - ($amount * 0.06),
                    'admin' => (($amount - $amount * 0.06)) * 0.05,
                    'net_payable' =>((($amount - $amount * 0.06)) - ((($amount - $amount * 0.06)) * 0.05)),
                    'moms_25_tax' => (($amount - ($amount * 0.06) - ((($amount - $amount * 0.06)) * 0.05) ) * 0.25),
                    'net_total' => ((($amount - $amount * 0.06)) - ((($amount - $amount * 0.06)) * 0.05)) - (($amount - ($amount * 0.06) - ((($amount - $amount * 0.06)) * 0.05) ) * 0.25),
                    'start_date' => $request->start_date,
                    'end_date' => $request->end_date,
                ]);
            } elseif ($type === 'uber') {
                $currentUberEarning = $user->uber_earning;
                // Calculate the new 'uber_earning' value by adding the new amount
                $newUberEarning = $currentUberEarning + $amount;

                // Update the user's 'uber_earning' with the new value
                DB::table('users')
                    ->where('name', $username)
                    ->where('last_name', $last_name)
                    ->update([
                        'uber_earning' => $newUberEarning,
                    ]);

                // Insert the record into the "ubers" table
                
                    DB::table('ubers')->insert([
                    'name' => $username,  
                    'last_name' => $last_name,
                    'uber_earning' => $amount,
                    'total' => $amount,
                    'moms_6_tax' => $amount * 0.06,
                    'net' => $amount - ($amount * 0.06),
                    'admin' => (($amount - $amount * 0.06)) * 0.05,
                    'net_payable' =>((($amount - $amount * 0.06)) - ((($amount - $amount * 0.06)) * 0.05)),
                    'moms_25_tax' => (($amount - ($amount * 0.06) - ((($amount - $amount * 0.06)) * 0.05) ) * 0.25),
                    'net_total' => ((($amount - $amount * 0.06)) - ((($amount - $amount * 0.06)) * 0.05)) - (($amount - ($amount * 0.06) - ((($amount - $amount * 0.06)) * 0.05) ) * 0.25),
                ]);
                
            }
            // Add more conditions for other "type" values if needed
        }
    }

    $driver = new ImportFile();
    if ($file = $request->file('csv_file')) {
        $video_name = md5(rand(1000, 10000));
        $ext = strtolower($file->getClientOriginalExtension());
        $video_full_name = $video_name . '.' . $ext;
        $upload_path = 'ImportFile/';
        $video_url = $upload_path . $video_full_name;
        $file->move($upload_path, $video_url);
        $driver->file = $video_url;
    }
    $driver->save();

    return response()->json(['message' => 'User records updated successfully']);
}





    public function fileGet()
    {
        $data = ImportFile::get();
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }



    public function fileDelete($id)
    {
        $program = ImportFile::find($id);
        if (!empty($program)) {
            $program->delete();
            return response()->json([
                'success' => true,
                'message' => ' delete successfuly',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'something wrong try again ',
            ]);
        }
    }



    public function uberdata()
    {
        $data = Uber::get();
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }

    public function boltdata()
    {
        $data = Bolt::get();
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }

}
