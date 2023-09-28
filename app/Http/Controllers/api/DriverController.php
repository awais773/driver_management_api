<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class DriverController extends Controller
{

public function index()
{
    $data = User::where('type', 'bolt')
                ->orWhere('type', 'uber')
                ->get();

    foreach ($data as $Driver) {
        $Driver->vehicle_image = json_decode($Driver->vehicle_image); // Decode the JSON-encoded location string
    }

    if ($data->isEmpty()) {
        return response()->json(['message' => 'Data not found'], 404);
    }

    return response()->json([
        'success' => true,
        'message' => 'All Data successfully retrieved',
        'data' => $data,
    ]);
}

      public function ApproedDriver()
    {
        $data = User::where(function ($query) {
            $query->where('type', 'bolt')
                ->orWhere('type', 'uber');
        })
        ->where('status', 'Approved')
        ->get();
    
        foreach ($data as $Driver) {
            $Driver->vehicle_image = json_decode($Driver->vehicle_image); // Decode the JSON-encoded location string
        }
    
        if ($data->isEmpty()) {
            return response()->json(['message' => 'Data not found'], 404);
        }
    
        return response()->json([
            'success' => true,
            'message' => 'All Data successfully retrieved',
            'data' => $data,
        ]);
    }


    public function B2BIndex()
    {
        $data = User::with('company')->where('type','b2b')->get();
         foreach ($data as $Driver) {
            $Driver->vehicle_image = json_decode($Driver->vehicle_image); // Decode the JSON-encoded location string
        }
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }
    public function B2Bshow($id)
    {
        $program = User::with('company')->where( 'id' ,$id)->first();
        $program->vehicle_image = json_decode($program->vehicle_image); // Decode the JSON-encoded location string

        if (is_null($program)) {
            return response()->json('Data not found', 404);
        }
        return response()->json([
            'success' => true,
            'data' => $program,
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
       $driver = User::create($request->post());
       $driver['password'] =  Hash::make($request->input('password')); // Hash the password
      if ($file = $request->file('profile_picture')) {
            $video_name = md5(rand(1000, 10000));
            $ext = strtolower($file->getClientOriginalExtension());
            $video_full_name = $video_name . '.' . $ext;
            $upload_path = 'driverImage/';
            $video_url = $upload_path . $video_full_name;
            $file->move($upload_path, $video_url);
            $driver->profile_picture = $video_url;
        }

        if ($files = $request->file('vehicle_image')) { // Assuming 'vehicle_images' is the input name for multiple files
            $imageUrls = []; // Initialize an array to store the image URLs
            foreach ($files as $file) {
                $image_name = md5(rand(1000, 10000)) . '.' . $file->getClientOriginalExtension();
                $upload_path = 'vehicleImage/';
                $image_url = $upload_path . $image_name;
                $file->move($upload_path, $image_name);
                $imageUrls[] = $image_url; // Store the image URL in the array
            }
            $driver->vehicle_image = $imageUrls; // Store the array of image URLs in the driver object
        }
        
        if ($file = $request->file('bank_upload_document')) {
            $video_name = md5(rand(1000, 10000));
            $ext = strtolower($file->getClientOriginalExtension());
            $video_full_name = $video_name . '.' . $ext;
            $upload_path = 'bankImage/';
            $video_url = $upload_path . $video_full_name;
            $file->move($upload_path, $video_url);
            $driver->bank_upload_document = $video_url;
        }

      $driver->save();
            return response()->json([
                'success' => true,
                'message' => 'driver Create successfull',
                  'data'  =>$driver,
            ], 200);
        }
    }

    public function show($id)
    {
        $program = User::find($id);
        $program->vehicle_image = json_decode($program->vehicle_image); // Decode the JSON-encoded location string

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

        $obj = User::find($id);
         if ($obj) {
            if (!empty($request->input('name'))) {
                $obj->name = $request->input('name');
            }
               if (!empty($request->input('last_name'))) {
                $obj->last_name = $request->input('last_name');
            }
            if (!empty($request->input('email'))) {
                $obj->email = $request->input('email');
            }
            if (!empty($request->input('security_code'))) {
                $obj->security_code = $request->input('security_code');
            }
            if (!empty($request->input('mobile'))) {
                $obj->mobile = $request->input('mobile');
            }
            if (!empty($request->input('gender'))) {
                $obj->gender = $request->input('gender');
            }
            if (!empty($request->input('emergency_contact_name'))) {
                $obj->emergency_contact_name = $request->input('emergency_contact_name');
            }
            if (!empty($request->input('emergency_contact_number'))) {
                $obj->emergency_contact_number = $request->input('emergency_contact_number');
            }
            if (!empty($request->input('address'))) {
                $obj->address = $request->input('address');
            }
            if (!empty($request->input('date_of_birth'))) {
                $obj->date_of_birth = $request->input('date_of_birth');
            }
            if (!empty($request->input('profile_picture'))) {
                $obj->profile_picture = $request->input('profile_picture');
            }
            if (!empty($request->input('salary'))) {
                $obj->salary = $request->input('salary');
            }
             if (!empty($request->input('salary_fix'))) {
                $obj->salary_fix = $request->input('salary_fix');
            }
             if (!empty($request->input('salary_commission'))) {
                $obj->salary_commission = $request->input('salary_commission');
            }
             if (!empty($request->input('hourly_enter_amount'))) {
                $obj->hourly_enter_amount = $request->input('hourly_enter_amount');
            }
            if (!empty($request->input('bank_name'))) {
                $obj->bank_name = $request->input('bank_name');
            }
            if (!empty($request->input('bank_title'))) {
                $obj->bank_title = $request->input('bank_title');
            }
            if (!empty($request->input('bank_account_number'))) {
                $obj->bank_account_number = $request->input('bank_account_number');
            }
            if (!empty($request->input('company_name_own'))) {
                $obj->company_name_own = $request->input('company_name_own');
            }
             if (!empty($request->input('bank_upload_document'))) {
                $obj->bank_upload_document = $request->input('bank_upload_document');
            }
            if (!empty($request->input('taxi_driving_liscence'))) {
                $obj->taxi_driving_liscence = $request->input('taxi_driving_liscence');
            }
            if (!empty($request->input('bank_emergency_contact_name'))) {
                $obj->bank_emergency_contact_name = $request->input('bank_emergency_contact_name');
            }
            if (!empty($request->input('vehicle_id'))) {
                $obj->vehicle_id = $request->input('vehicle_id');
            }

            if (!empty($request->input('status'))) {
                $obj->status = $request->input('status');
            }

            if (!empty($request->input('total_number_hour'))) {
                $obj->total_number_hour = $request->input('total_number_hour');
            }

            ///  vehicle

            
            if (!empty($request->input('vehicle_name'))) {
                $obj->vehicle_name = $request->input('vehicle_name');
            }

            if (!empty($request->input('vehicle_company'))) {
                $obj->vehicle_company = $request->input('vehicle_company');
            }

            if (!empty($request->input('description'))) {
                $obj->description = $request->input('description');
            }


            if (!empty($request->input('car_make'))) {
                $obj->car_make = $request->input('car_make');
            }


            if (!empty($request->input('car_model'))) {
                $obj->car_model = $request->input('car_model');
            }

            if (!empty($request->input('car_color'))) {
                $obj->car_color = $request->input('car_color');
            }
            if (!empty($request->input('car_number'))) {
                $obj->car_number = $request->input('car_number');
            }

            if (!empty($request->input('vehicle_image'))) {
                $obj->vehicle_image = $request->input('vehicle_image');
            }
            
            if (!empty($request->input('selectedCarType'))) {
                $obj->selectedCarType = $request->input('selectedCarType');
            }

            if (!empty($request->input('password'))) {
                $obj->password = ($request->input('password'));
            }

            if (!empty($request->input('joining_date'))) {
                $obj->joining_date = ($request->input('joining_date'));
            }

            if (!empty($request->input('salary_commission_exclusive'))) {
                $obj->salary_commission_exclusive = ($request->input('salary_commission_exclusive'));
            }
              if (!empty($request->input('postal_code'))) {
                $obj->postal_code = ($request->input('postal_code'));
            }
                if (!empty($request->input('city'))) {
                $obj->city = ($request->input('city'));
            }
            if (!empty($request->input('card'))) {
                $obj->card = ($request->input('card'));
            }
             if (!empty($request->input('company_id'))) {
                $obj->company_id = ($request->input('company_id'));
            }

            if ($file = $request->file('profile_picture')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'driverImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $obj->profile_picture = $video_url;
            }

            if ($files = $request->file('vehicle_image')) { // Assuming 'vehicle_images' is the input name for multiple files
                $imageUrls = []; // Initialize an array to store the image URLs
                foreach ($files as $file) {
                    $image_name = md5(rand(1000, 10000)) . '.' . $file->getClientOriginalExtension();
                    $upload_path = 'vehicleImage/';
                    $image_url = $upload_path . $image_name;
                    $file->move($upload_path, $image_name);
                    $imageUrls[] = $image_url; // Store the image URL in the array
                }
                $obj->vehicle_image = $imageUrls; // Update the array of image URLs in the object
            }
            if ($file = $request->file('bank_upload_document')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'bankImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $obj->bank_upload_document = $video_url;
            }
             $obj->save();
        }
        return response()->json([
            'success' => true,
            'message' => 'Driver is updated successfully',
            'data' => $obj,
        ]);
    }


    public function destroy($id)
    {
        $program = User::find($id);
        if (!empty($program)) {
            $program->delete();
            return response()->json([
                'success' => true,
                'message' => 'delete successfuly',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'something wrong try again ',
            ]);
        }
    }

}
