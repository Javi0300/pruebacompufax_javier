<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


//Route::post('/clientes', [ClientesController::class, 'servicioweb'])->name('servicioweb');
