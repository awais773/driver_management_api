<?php

namespace App\Http\Controllers\api;

use App\Models\Expense;
use App\Models\ImportFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ExpenseController extends Controller
{


    public function index()
    {
        $data = Expense::with('driver')->select('user_id',
            DB::raw('SUM(CASE WHEN card = "Payable" THEN amount ELSE 0 END) as total_payable'),
            DB::raw('SUM(CASE WHEN card = "Receiveable" THEN amount ELSE 0 END) as total_receivable'),
            DB::raw('SUM(CASE WHEN status = "Pending" THEN 1 ELSE 0 END) as total_pending'))
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


    public function B2BIndex()
    {
        $data = Expense::where('type','b2b')->get();
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
                // 'message' => $validator->errors()->toJson()
                'message' => 'Email already exist',

            ], 400);
        } {
       $Expense = Expense::create($request->post());
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
            return response()->json([
                'success' => true,
                'message' => 'Expense Create successfull',
                  'data'  =>$Expense,
            ], 200);
        }
    }

    public function show($id)
    {
        $program = Expense::with('driver')->where('id',$id)->first();
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
            if (!empty($request->input('meter_reading'))) {
                $obj->meter_reading = $request->input('meter_reading');
            }
            if (!empty($request->input('total_life_kilometer'))) {
                $obj->total_life_kilometer = $request->input('total_life_kilometer');
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
        $data = Expense::with('driver')->where('user_id',$id)->get();
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
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
public function processCSV(Request $request)
{
    $request->validate([
        'csv_file' => 'required|mimes:csv,txt',
        'type' => 'required|in:b2b,driver', // Add validation for the "type" parameter
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

        // Retrieve the user based on their username and last_name
        $user = DB::table('users')
            ->where('name', $username)
            ->where('last_name', $last_name)
            ->where('type', $type)
            ->first();

        if ($user) {
            // Depending on the "type" from the request, update the corresponding field
            if ($type === 'bolt') {
                $currentB2BEarning = $user->uber_earning;
                // Calculate the new 'b2b_earning' value by adding the new amount
                $newB2BEarning = $currentB2BEarning + $amount;

                // Update the user's 'b2b_earning' with the new value
                DB::table('users')
                    ->where('name', $username)
                    ->where('last_name', $last_name)
                    ->update([
                        'uber_earning' => $newB2BEarning,
                    ]);
            } elseif ($type === 'uber') {
                $currentDriverEarning = $user->uber_earning;
                // Calculate the new 'driver_earning' value by adding the new amount
                $newDriverEarning = $currentDriverEarning + $amount;

                // Update the user's 'driver_earning' with the new value
                DB::table('users')
                    ->where('name', $username)
                    ->where('last_name', $last_name)
                    ->update([
                        'uber_earning' => $newDriverEarning,
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

}
