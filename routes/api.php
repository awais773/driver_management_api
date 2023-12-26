<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::get('auth', [AuthController::class, 'redirectToAuth']);
// Route::get('auth/callback', [AuthController::class, 'handleAuthCallback']);

Route::get('/auth',[App\Http\Controllers\api\AuthController::class,'redirectToAuth']);
Route::get('auth/callback',[App\Http\Controllers\api\AuthController::class,'handleAuthCallback']);



Route::get('/instructor',[App\Http\Controllers\api\AuthController::class,'instructor']);
Route::get('/student',[App\Http\Controllers\api\AuthController::class,'student']);

  // user //

Route::post('register',[App\Http\Controllers\api\AuthController::class,'register']);
Route::post('login',[App\Http\Controllers\api\AuthController::class,'login']);
Route::post('signIn',[App\Http\Controllers\api\AuthController::class,'Applogin']);
Route::post('newlogin',[App\Http\Controllers\api\AuthController::class,'newlogin']);
Route::post('/forgotPassword', [App\Http\Controllers\api\AuthController::class, 'forgotPassword']);
Route::post('/updatePassword', [App\Http\Controllers\api\AuthController::class, 'updatePassword']);


               //blogs

Route::post('addBlog',[App\Http\Controllers\api\AdminAuthController::class,'addBlog']);
Route::get('blogGet',[App\Http\Controllers\api\AdminAuthController::class,'blogGet']);
Route::get('blogGet/{id}',[App\Http\Controllers\api\AdminAuthController::class,'show']);
Route::delete('blogDestroy/{id}',[App\Http\Controllers\api\AdminAuthController::class,'blogDestroy']);
Route::post('blogUpdate/{id}',[App\Http\Controllers\api\AdminAuthController::class,'update']);
Route::post('/otp/verify', [App\Http\Controllers\api\AuthController::class, 'otpVerification']);



    ///  contact
Route::apiResource('contacts', App\Http\Controllers\api\ContactController::class);
    //    Driver
Route::apiResource('drivers', App\Http\Controllers\api\DriverController::class);
Route::post('/driversUpdate/{id}', [App\Http\Controllers\api\DriverController::class, 'update']);
Route::get('/ApproedDriver', [App\Http\Controllers\api\DriverController::class, 'ApproedDriver']);

        //  Vehicle
Route::apiResource('vehicle', App\Http\Controllers\api\VehicleController::class);
Route::post('/vehicleUpdate/{id}', [App\Http\Controllers\api\VehicleController::class, 'update']);
Route::get('/notAssign', [App\Http\Controllers\api\VehicleController::class, 'notAssign']);
Route::get('/B2BShow/{id}', [App\Http\Controllers\api\VehicleController::class, 'B2BShow']);
Route::get('/deltils/{id}', [App\Http\Controllers\api\VehicleController::class, 'deltils']);

         //B2b
Route::get('/B2BIndex', [App\Http\Controllers\api\VehicleController::class, 'B2BIndex']);
Route::get('/B2BgetDriver', [App\Http\Controllers\api\DriverController::class, 'B2BIndex']);
Route::get('/B2Bshowdriver/{id}', [App\Http\Controllers\api\DriverController::class, 'B2Bshow']);

        //  Expense
Route::apiResource('expense', App\Http\Controllers\api\ExpenseController::class);
Route::post('/expenseUpdate/{id}', [App\Http\Controllers\api\ExpenseController::class, 'update']);
Route::get('/detailsExpensive/{id}', [App\Http\Controllers\api\ExpenseController::class, 'detailsExpensive']);
Route::post('/processCSV', [App\Http\Controllers\api\ExpenseController::class, 'processCSV']);
Route::get('/fileGet', [App\Http\Controllers\api\ExpenseController::class, 'fileGet']);
Route::delete('/fileDelete/{id}', [App\Http\Controllers\api\ExpenseController::class, 'fileDelete']);
Route::get('/uberdata', [App\Http\Controllers\api\ExpenseController::class, 'uberdata']);
Route::get('/boltdata', [App\Http\Controllers\api\ExpenseController::class, 'boltdata']);
Route::get('/paymentShow/{id}', [App\Http\Controllers\api\ExpenseController::class, 'paymentShow']);
Route::get('/VehicleExpense/{id}', [App\Http\Controllers\api\ExpenseController::class, 'VehicleExpense']);
Route::post('/reportAdd', [App\Http\Controllers\api\ExpenseController::class, 'reportAdd']);
Route::get('/getMonthlyexpense', [App\Http\Controllers\api\ExpenseController::class, 'getMonthlyexpense']);
Route::get('/getMonthlyearning', [App\Http\Controllers\api\ExpenseController::class, 'getMonthlyearning']);
Route::get('/calculateEfficiency', [App\Http\Controllers\api\ExpenseController::class, 'calculateEfficiency']);
Route::get('/driverDetails/{id}', [App\Http\Controllers\api\ExpenseController::class, 'driverDetails']);
Route::get('/driverEfficiency/{id}', [App\Http\Controllers\api\ExpenseController::class, 'driverEfficiency']);
Route::get('/driverUber/{name}/{last_name}', [App\Http\Controllers\api\ExpenseController::class, 'driverUber']);

       //dashboard
Route::get('/dashboard', [App\Http\Controllers\api\ExpenseController::class, 'dashboard']);


        //  invoice
Route::apiResource('invoice', App\Http\Controllers\api\InvoiceController::class);
Route::post('/invoiceUpdate/{id}', [App\Http\Controllers\api\InvoiceController::class, 'update']);
Route::get('/reportshow/{id}', [App\Http\Controllers\api\InvoiceController::class, 'reportshow']);
Route::get('/driverInvoice/{id}', [App\Http\Controllers\api\InvoiceController::class, 'driverInvoice']);


       //  Service
Route::apiResource('service', App\Http\Controllers\api\ServiceController::class);
Route::post('/serviceUpdate/{id}', [App\Http\Controllers\api\ServiceController::class, 'update']);
Route::get('/allGet', [App\Http\Controllers\api\ServiceController::class, 'allGet']);
Route::get('/showAll/{id}', [App\Http\Controllers\api\ServiceController::class, 'showAll']);
Route::get('/driverMaintence/{id}', [App\Http\Controllers\api\ServiceController::class, 'driverMaintence']);

/// company
Route::apiResource('company', App\Http\Controllers\api\CompanyController::class);
Route::post('/companyUpdate/{id}', [App\Http\Controllers\api\CompanyController::class, 'update']);




Route::middleware('auth:api')->group(function () {
Route::post('/PasswordChanged ', [App\Http\Controllers\api\AuthController::class, 'PasswordChanged']);
Route::post('/update/AdminProfile', [App\Http\Controllers\api\AdminAuthController::class, 'adminProfile']);
Route::get('/logout',[App\Http\Controllers\api\AuthController::class,'logout']);
Route::get('AllUser',[App\Http\Controllers\api\MessageController::class,'AllUser']);
Route::put('/update/profile', [App\Http\Controllers\api\AuthController::class, 'updateProfile']);





});
