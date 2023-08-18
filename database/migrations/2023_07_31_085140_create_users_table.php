<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('ssn')->nullable();
            $table->string('status')->nullable();
            $table->string('mobile')->nullable();
            $table->string('gender')->nullable();
            $table->string('emergency_name')->nullable();
            $table->string('emergency_number')->nullable();
            $table->string('address')->nullable();
            $table->string('date_of_birth')->nullable();
            $table->string('profile_picture')->nullable();
            $table->string('salary')->nullable();
            $table->string('salary_fix')->nullable();
            $table->string('salary_commission')->nullable();
            $table->string('hourly_enter_amount')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('bank_title')->nullable();
            $table->string('bank_account_number')->nullable();
            $table->string('company_name_own')->nullable();
            $table->string('bank_upload_document')->nullable();
            $table->string('taxi_driving_liscence')->nullable();
            $table->string('bank_emergency_contact_name')->nullable();
            $table->string('company_name')->nullable();
            $table->string('owner_name')->nullable();
            $table->string('owner_number')->nullable();
            $table->string('company_document')->nullable();
            $table->unsignedBigInteger('vehicle_id')->nullable();
            $table->string('vehicle_name')->nullable();
            $table->string('vehicle_company')->nullable();
            $table->string('description')->nullable();
            $table->string('car_make')->nullable();
            $table->string('car_model')->nullable();
            $table->string('car_color')->nullable();
            $table->string('car_number')->nullable();
            $table->string('vehicle_image')->nullable();
            $table->string('total_number_hour')->nullable();
            $table->string('password')->nullable();
            $table->string('selectedCarType')->nullable();
            $table->string('type')->nullable();
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};



