<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('resortlayout-1');
});
Route::get('/rooms', function () {
    return view('rooms');
});
Route::get('/contactus', function () {
    return view('contactus');
});
Route::get('/resortlayout-1', function () {
    return view('resortlayout-1');
});
