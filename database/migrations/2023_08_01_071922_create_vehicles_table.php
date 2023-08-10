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
    Schema::create('vehicles', function (Blueprint $table) {
        $table->id();
        $table->string('name')->nullable();
        $table->string('vehicle_company')->nullable();
        $table->string('description')->nullable();
        $table->string('car_make')->nullable();
        $table->string('car_model')->nullable();
        $table->string('car_color')->nullable();
        $table->string('car_number')->nullable();
        $table->string('model_year')->nullable();
        $table->string('registration_number')->nullable();
        $table->string('equipment')->nullable();
        $table->string('image')->nullable();
        $table->string('vehicle_type')->nullable();
        $table->string('last_inspection')->nullable();
        $table->string('insurance')->nullable();
        $table->string('texameter_inspection_date')->nullable();
        $table->string('next_inspection')->nullable();
        $table->string('category_of_vehicle')->nullable();
        $table->string('vendor_name')->nullable();
        $table->string('insurance_company_name')->nullable();
        $table->string('car_maintenance_feature')->nullable();
        $table->string('select_equipment')->nullable();
        $table->string('running')->nullable();
        $table->string('oil_change')->nullable();
        $table->string('mileage')->nullable();
        $table->string('accidental_claim')->nullable();
        $table->string('other_expense')->nullable();
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
    Schema::dropIfExists('vehicles');
}
};
