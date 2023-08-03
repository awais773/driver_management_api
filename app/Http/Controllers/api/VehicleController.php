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
            'email' => 'required|string|email|max:255|unique:users',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                // 'message' => $validator->errors()->toJson()
                'message' => 'Email already exist',

            ], 400);
        } {
            $vehicles = Vehicle::create([
                'id' => $request->id,
                'name' => $request->name,
                'vehicle_company' => $request->vehicle_company,
                'description' => $request->description,
                'car_make' => $request->car_make,
                'car_model' => $request->car_model,
                'car_color' => $request->car_color,
                'car_number' => $request->car_number,
                'model_year' => $request->model_year,
                'registration' => $request->registration,
                'equipment' => $request->equipment,
                // 'block'=> $request->block,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'User Create successfull',
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
        $validator = Validator::make($request->all(), [
            // 'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $vehicle = Vehicle::find($id);
          $vehicle->role_id = $request->role_id;
        $vehicle->name = $request->name;
        $vehicle->vehicle_company = $request->vehicle_company;
        $vehicle->description = $request->description;
        $vehicle->car_make = $request->car_make;
        $vehicle->car_model = $request->car_model;
        $vehicle->car_color = $request->car_color;
        $vehicle->car_number = $request->car_number;
        $vehicle->model_year = $request->model_year;
        $vehicle->registration = $request->registration;
        $vehicle->equipment = $request->equipment;
        // $program->block = $request->block;
        $vehicle->update();
        return response()->json([
            'success' => true,
            'message' => 'User updated successfully.',
            'data' => $vehicle,
        ], 200);
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
