<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Support\Str;
use App\Models\User;


class AuthController extends Controller
{
    // ✅ Register
    public function register(Request $request)
    {
        $fields = $request->validate([
            'f_name' => 'required|string|max:100',
            'l_name' => 'required|string|max:100',
            'email' => 'required|string|email|unique:users,email',
            'phone' => 'required|string|max:20',
            'country' => 'required|string|max:100',
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'preferred_wallet' => 'nullable|string',
            'crypto_wallet' => 'nullable|string',
            'traded_before' => 'boolean',
            'highest_investment' => 'numeric|min:0',
        ]);

        $user = User::create([
            'userid' => Str::random(8), // or custom logic like "USR" . time()
            'f_name' => $request->f_name,
            'l_name'  => $request->l_name,
            'email' => $fields['email'],
            'phone' => $fields['phone'],
            'country' => $fields['country'],
            'password' => Hash::make($fields['password']),
            'preferred_wallet' => $fields['preferred_wallet'] ?? null,
            'crypto_wallet' => $fields['crypto_wallet'] ?? null,
            'traded_before' => $fields['traded_before'] ?? 0,
            'highest_investment' => $fields['highest_investment'] ?? 0,
        ]);

        // Generate token
        $token = $user->createToken('apitoken')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $token,
            'message' => 'Account created successfully',
        ], 201);
    }

    // ✅ Login
    public function login(Request $request)
    {
        $fields = $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $user = User::where('email', $fields['email'])->first();

        if (! $user || ! Hash::check($fields['password'], $user->password)) {
            return response()->json([
                'message' => 'Invalid credentials',
            ], 401);
        }

        // Revoke old tokens (optional, good for security)
        $user->tokens()->delete();

        $token = $user->createToken('apitoken')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $token,
            'message' => 'Login successful',
        ]);
    }

    // ✅ Logout
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return response()->json([
            'message' => 'Logged out successfully',
        ]);
    }
}
