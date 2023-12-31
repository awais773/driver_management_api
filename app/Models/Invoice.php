<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    protected $guarded = [] ;


    public function driver() {
        return $this->hasOne(User::class, 'id', 'user_id');  
    }
    public function company() {
        return $this->belongsTo(Company::class, 'id', 'company_id');  
    }

}
