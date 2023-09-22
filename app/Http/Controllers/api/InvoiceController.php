<?php

namespace App\Http\Controllers\api;

use App\Models\Invoice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Vehicle;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class InvoiceController extends Controller
{




    public function show($id)
    {
        $program = Invoice::with('driver')->where('id',$id)->first();
        if (is_null($program)) {
            return response()->json('Data not found', 404);
        }
        return response()->json([
            'success' => true,
            'data' => $program,
        ]);
    }


    

    public function reportshow($id)
    {
        $program = Invoice::latest()->with('driver')->where('user_id',$id)->first();
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

        $obj = Invoice::find($id);
         if ($obj) {
            if (!empty($request->input('vehicle_id'))) {
                $obj->vehicle_id = $request->input('vehicle_id');
            }
            if (!empty($request->input('Invoice_meter_reading'))) {
                $obj->Invoice_meter_reading = $request->input('Invoice_meter_reading');
            }
            if (!empty($request->input('category'))) {
                $obj->category = $request->input('category');
            }
            if ($file = $request->file('image')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'InvoiceImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $obj->image = $video_url;
            }
             $obj->save();

        }
        $obj = Vehicle::find($request->vehicle_id);
        if ($obj) {
           if (!empty($request->input('Invoice_meter_reading'))) {
               $obj->Invoice_meter_reading = $request->input('Invoice_meter_reading');
           }
            $obj->save();
  
       }
        return response()->json([
            'success' => true,
            'message' => 'Invoice is updated successfully',
            'data' => $obj,
        ]);
    }


    public function destroy($id)
    {
        $program = Invoice::find($id);
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



    public function index()
    {
        $data = Invoice::with('driver')->get();
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
