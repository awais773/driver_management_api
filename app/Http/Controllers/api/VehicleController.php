<?php

namespace App\Http\Controllers\api;

use App\Models\Vehicle;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class VehicleController extends Controller
{

    public function index()
    {
        $data = Vehicle::get();
        foreach ($data as $Driver) {
            $Driver->image = json_decode($Driver->image); // Decode the JSON-encoded location string
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
       $vehicles = Vehicle::create($request->post());
       if ($files = $request->file('image')) { // Assuming 'vehicle_images' is the input name for multiple files
        $imageUrls = []; // Initialize an array to store the image URLs
        foreach ($files as $file) {
            $image_name = md5(rand(1000, 10000)) . '.' . $file->getClientOriginalExtension();
            $upload_path = 'vehicleImage/';
            $image_url = $upload_path . $image_name;
            $file->move($upload_path, $image_name);
            $imageUrls[] = $image_url; // Store the image URL in the array
        }
        $vehicles->image = $imageUrls; // Store the array of image URLs in the driver object
    }
    
      $vehicles->save();
            return response()->json([
                'success' => true,
                'message' => 'vehicle Create successfull',
                'date' => $vehicles,
            ], 200);
        }
    }

    public function show($id)
    {
        $program = Vehicle::find($id);
        $program->image = json_decode($program->image); // Decode the JSON-encoded location string
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

        $obj = Vehicle::find($id);
         if ($obj) {
            if (!empty($request->input('name'))) {
                $obj->name = $request->input('name');
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
            if (!empty($request->input('model_year'))) {
                $obj->model_year = $request->input('model_year');
            }
            if (!empty($request->input('registration_number'))) {
                $obj->registration_number = $request->input('registration_number');
            }
            if (!empty($request->input('equipment'))) {
                $obj->equipment = $request->input('equipment');
            }

            if (!empty($request->input('vehicle_type'))) {
                $obj->vehicle_type = $request->input('vehicle_type');
            }
            if (!empty($request->input('last_inspection'))) {
                $obj->last_inspection = $request->input('last_inspection');
            }
            if (!empty($request->input('next_inspection'))) {
                $obj->next_inspection = $request->input('next_inspection');
            }
            if (!empty($request->input('insurance'))) {
                $obj->insurance = $request->input('insurance');
            }
            if (!empty($request->input('texameter_inspection_date'))) {
                $obj->texameter_inspection_date = $request->input('texameter_inspection_date');
            }
            if (!empty($request->input('category_of_vehicle'))) {
                $obj->category_of_vehicle = $request->input('category_of_vehicle');
            }
            if (!empty($request->input('vendor_name'))) {
                $obj->vendor_name = $request->input('vendor_name');
            }
            if (!empty($request->input('insurance_company_name'))) {
                $obj->insurance_company_name = $request->input('insurance_company_name');
            }
            if (!empty($request->input('car_maintenance_feature'))) {
                $obj->car_maintenance_feature = $request->input('car_maintenance_feature');
            }
            if (!empty($request->input('select_equipment'))) {
                $obj->select_equipment = $request->input('select_equipment');
            }

            if (!empty($request->input('running'))) {
                $obj->running = $request->input('running');
            }
            if (!empty($request->input('oil_change'))) {
                $obj->oil_change = $request->input('oil_change');
            }
            if (!empty($request->input('mileage'))) {
                $obj->mileage = $request->input('mileage');
            }
            if (!empty($request->input('accidental_claim'))) {
                $obj->accidental_claim = $request->input('accidental_claim');
            }
            if (!empty($request->input('other_expense'))) {
                $obj->other_expense = $request->input('other_expense');
            }

            if ($files = $request->file('image')) { // Assuming 'vehicle_images' is the input name for multiple files
                $imageUrls = []; // Initialize an array to store the image URLs
                foreach ($files as $file) {
                    $image_name = md5(rand(1000, 10000)) . '.' . $file->getClientOriginalExtension();
                    $upload_path = 'vehicleImage/';
                    $image_url = $upload_path . $image_name;
                    $file->move($upload_path, $image_name);
                    $imageUrls[] = $image_url; // Store the image URL in the array
                }
                $obj->image = $imageUrls; // Update the array of image URLs in the object
            }
             $obj->save();

        }
        return response()->json([
            'success' => true,
            'message' => 'Vehicle is updated successfully',
            'data' => $obj,
        ]);
    }

    public function destroy($id)
    {
        $program = Vehicle::find($id);
        if (!empty($program)) {
            $program->delete();
            return response()->json([
                'success' => 'True',
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
