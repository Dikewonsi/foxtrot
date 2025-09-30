<?php

    namespace App\Models;

    use Illuminate\Database\Eloquent\Factories\HasFactory;
    use Illuminate\Foundation\Auth\User as Authenticatable;
    use Illuminate\Notifications\Notifiable;
    use Illuminate\Support\Str;
    use Laravel\Sanctum\HasApiTokens;

    class User extends Authenticatable
    {
        use HasApiTokens, HasFactory, Notifiable;

        protected $fillable = [
            'userid',
            'f_name',
            'l_name',
            'email',
            'password',
            'phone',
            'country',
            'preferred_wallet',
            'crypto_wallet',
            'traded_before',
            'highest_investment',
        ];

        protected static function booted()
        {
            static::creating(function ($user) {
                $user->userid = Str::uuid(); // or generate your own unique string/number
            });
        }


        protected $hidden = [
            'password',
            'remember_token',
        ];

        protected function casts(): array
        {
            return [
                'email_verified_at' => 'datetime',
                'password' => 'hashed',
            ];
        }
    }
