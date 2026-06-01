<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return 'Laravel DevOps Assessment';
});

Route::get('/health', function () {

    return response()->json([
        'status' => 'healthy'
    ]);

});