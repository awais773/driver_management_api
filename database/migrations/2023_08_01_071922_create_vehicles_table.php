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
