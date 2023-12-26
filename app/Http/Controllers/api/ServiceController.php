<?php

namespace App\Http\Controllers\api;

use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Vehicle;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ServiceController extends Controller
{



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
       $Service = Service::create($request->post());
      if ($file = $request->file('image')) {
            $video_name = md5(rand(1000, 10000));
            $ext = strtolower($file->getClientOriginalExtension());
            $video_full_name = $video_name . '.' . $ext;
            $upload_path = 'serviceImage/';
            $video_url = $upload_path . $video_full_name;
            $file->move($upload_path, $video_url);
            $Service->image = $video_url;
        }
      $Service->save();

      /// Vehicle update
      $obj = Vehicle::find($request->vehicle_id);
      if ($obj) {
         if (!empty($request->input('service_meter_reading'))) {
             $obj->service_meter_reading = $request->input('service_meter_reading');
         }
          $obj->save();

     }

            return response()->json([
                'success' => true,
                'message' => 'Service Create successfull',
                  'data'  =>$Service,
            ], 200);
        }
    }

    public function show($id)
    {
        $program = Service::with('vehicle')->where('id',$id)->first();
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

        $obj = Service::find($id);
         if ($obj) {
            if (!empty($request->input('vehicle_id'))) {
                $obj->vehicle_id = $request->input('vehicle_id');
            }
            if (!empty($request->input('service_meter_reading'))) {
                $obj->service_meter_reading = $request->input('service_meter_reading');
            }
            if (!empty($request->input('category'))) {
                $obj->category = $request->input('category');
            }
            if (!empty($request->input('total_life_kilometer'))) {
                $obj->total_life_kilometer = $request->input('total_life_kilometer');
            }

            
            if ($file = $request->file('image')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'serviceImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $obj->image = $video_url;
            }
             $obj->save();

        }
        $obj = Vehicle::find($request->vehicle_id);
        if ($obj) {
           if (!empty($request->input('service_meter_reading'))) {
               $obj->service_meter_reading = $request->input('service_meter_reading');
           }
            $obj->save();
  
       }
        return response()->json([
            'success' => true,
            'message' => 'Service is updated successfully',
            'data' => $obj,
        ]);
    }


    public function destroy($id)
    {
        $program = Service::find($id);
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



    public function allGet()
    {
        $data = Service::with('vehicle')
        ->get();
        if (is_null($data)) {
            return response()->json('data not found',);
        }
        return response()->json([
            'success' => true,
            'message' => 'All Data susccessfull',
            'data' => $data,
        ]);
    }

    public function Index()
    {
        $data = Service::with('vehicle')
            ->select('vehicle_id', DB::raw('MAX(id) as max_id'))
            ->groupBy('vehicle_id')
            ->get();
    
        if ($data->isEmpty()) {
            return response()->json('data not found');
        }
    
        // Now, you can fetch the complete records using the obtained max_id values.
        $completeData = Service::with('vehicle')
            ->whereIn('id', $data->pluck('max_id'))
            ->get();
    
        return response()->json([
            'success' => true,
            'message' => 'All Data successful',
            'data' => $completeData,
        ]);
    }
    

    public function showAll($id)
    {
        $program = Service::with('vehicle')->where('vehicle_id',$id)->get();
        if (is_null($program)) {
            return response()->json('Data not found', 404);
        }
        return response()->json([
            'success' => true,
            'data' => $program,
        ]);
    }

    public function driverMaintence($id)
{
    // Get the vehicle_id for the specified $id
    $vehicleId = Service::with('vehicle')->where('id', $id)->value('vehicle_id');

    if (!$vehicleId) {
        return response()->json(['success' => false, 'message' => 'Service record not found']);
    }

    // Get the latest service record for the obtained vehicle_id
    $latestServiceRecord = Service::with('vehicle')->where('vehicle_id', $vehicleId)
        ->orderBy('id', 'desc')
        ->get();

    if (!$latestServiceRecord) {
        return response()->json(['success' => false, 'message' => 'No service record found for the specified vehicle_id']);
    }

    return response()->json([
        'success' => true,
        'message' => 'Latest service record retrieved successfully',
        'data' => $latestServiceRecord,
    ]);
}

    

}
