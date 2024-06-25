<?php

namespace App\Http\Controllers;

use App\Models\Direcciones;

use Illuminate\Http\Request;

class DireccionesController extends Controller
{
    public function index()
    {
        $direcciones = Direcciones::all();
        if(count($direcciones) > 0)        
        {
            return response()->json($direcciones, 201);
        }
        else{
            return response()->json(['cero' => "Registros inexistentes."]);
        }
    }

    public function update(Request $request)
    {
        $json = $request->json()->all();
        $direccion = Direcciones::find($request->id);
        if($direccion)
        {
            $direccion->calle = $json['calle'];
            $direccion->ciudad = $json['ciudad'];
            $direccion->codigo_postal = $json['codigo_postal'];
            $direccion->update();
            return response()->json([
                'message' => "Direccion actualizada correctamente.",
                'data' => $direccion
            ], 201);
        }
        else
        {
            return response()->json(['fail' => "Direccion inexistente."]);
        }
    }
}
