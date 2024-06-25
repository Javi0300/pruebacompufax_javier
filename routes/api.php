<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
#--------------------------------------#
use App\Http\Controllers\ClientesController;
use App\Http\Controllers\DireccionesController;
use App\Http\Controllers\OrdenesController;
#--------------------------------------#

//CLIENTES
Route::get('clientes', [ClientesController::class, 'index']);
Route::post('clientes', [ClientesController::class, 'store']);
Route::get('clientes/{id}', [ClientesController::class, 'search']);
//DIRECCIONES
Route::get('direcciones', [DireccionesController::class, 'index']);
Route::post('direcciones', [DireccionesController::class, 'update']);
//ORDENES
Route::get('ordenes', [OrdenesController::class, 'index']);
Route::post('ordenes', [OrdenesController::class, 'store']);
Route::get('ordenes/{id}', [OrdenesController::class, 'search_id']);
Route::get('ordenes/folio/{folio}', [OrdenesController::class, 'search_folio']);