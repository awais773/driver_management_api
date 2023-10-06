<?php

namespace App\Http\Controllers\api;

use App\Models\Company;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class CompanyController extends Controller
{

    public function index()
    {
        $data = Company::get();
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
            $Companys = Company::create($request->post());
            if ($file = $request->file('company_document')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'CompanyImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $Companys->company_document = $video_url;
            }
            $Companys->save();
            return response()->json([
                'success' => true,
                'message' => 'Company Create successfull',
                'date' => $Companys,
            ], 200);
        }
    }

    public function show($id)
    {
        $program = Company::find($id);
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

        $obj = Company::find($id);
        if ($obj) {
            if (!empty($request->input('company_name'))) {
                $obj->company_name = $request->input('company_name');
            }
            if (!empty($request->input('owner_name'))) {
                $obj->owner_name = $request->input('owner_name');
            }

            if (!empty($request->input('owner_number'))) {
                $obj->owner_number = $request->input('owner_number');
            }

            if (!empty($request->input('vehicle_id'))) {
                $obj->vehicle_id = $request->input('vehicle_id');
            }

            if (!empty($request->input('user_id'))) {
                $obj->user_id = $request->input('user_id');
            }

            if (!empty($request->input('category'))) {
                $obj->category = $request->input('category');
            }

            if ($file = $request->file('company_document')) {
                $video_name = md5(rand(1000, 10000));
                $ext = strtolower($file->getClientOriginalExtension());
                $video_full_name = $video_name . '.' . $ext;
                $upload_path = 'CompanyImage/';
                $video_url = $upload_path . $video_full_name;
                $file->move($upload_path, $video_url);
                $obj->company_document = $video_url;
            }
            $obj->save();
        }
        return response()->json([
            'success' => true,
            'message' => 'Company is updated successfully',
            'data' => $obj,
        ]);
    }

    public function destroy($id)
    {
        $program = Company::find($id);
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
