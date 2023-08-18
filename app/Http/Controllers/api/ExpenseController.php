<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Expense;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ExpenseController extends Controller
{


    public function index()
    {
        $data = Expense::with('driver')->get();
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

}
