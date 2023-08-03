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
      if ($file = $request->file('image')) {
            $video_name = md5(rand(1000, 10000));
            $ext = strtolower($file->getClientOriginalExtension());
            $video_full_name = $video_name . '.' . $ext;
            $upload_path = 'vehiceImage/';
            $video_url = $upload_path . $video_full_name;
            $file->move($upload_path, $video_url);
            $vehicles->image = $video_url;
        };
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
                $obj->model_year = Hash::make($request->input('model_year'));
            }
            if (!empty($request->input('registration_number'))) {
                $obj->registration_number = $request->input('registration_number');
            }
            if (!empty($request->input('equipment'))) {
                $obj->equipment = $request->input('equipment');
            }
            if (!empty($request->input('vehicle_id'))) {
                $obj->vehicle_id = $request->input('vehicle_id');
            }

        if ($file = $request->file('image')) {
            $video_name = md5(rand(1000, 10000));
            $ext = strtolower($file->getClientOriginalExtension());
            $video_full_name = $video_name . '.' . $ext;
            $upload_path = 'vehicleImage/';
            $video_url = $upload_path . $video_full_name;
            $file->move($upload_path, $video_url);
            $obj->image = $video_url;
        };
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
