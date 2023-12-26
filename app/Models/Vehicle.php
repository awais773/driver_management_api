<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    use HasFactory;
    protected $guarded = [] ; 

    public function driver() {
        return $this->belongsTo(User::class, 'id', 'vehicle_id');  
    }
    
    public function company() {
        return $this->hasOne(Company::class, 'id', 'company_id');  
    }

}
