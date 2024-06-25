<?php

namespace App\Http\Controllers;

use App\Models\Clientes;
use Illuminate\Http\Request;

class ClientesController extends Controller
{
    public function index()
    {
        $clientes = Clientes::all();
        if(count($clientes) > 0)        
        {
            return response()->json($clientes, 201);
        }
        else{
            return response()->json(['cero' => "Registros inexistentes."]);
        }
    }

    public function store(Request $request)
    {
        $json = $request->json()->all();
        // Creaa clientes
        $clientes = new Clientes();
        $clientes->nombre = $json['nombre'];
        $clientes->apellido = $json['apellido'];
        $clientes->edad = $json['edad'];
        $clientes->email = $json['email'];
        $clientes->save();

        if($clientes->id)
        {
            return response()->json(['success' => "Cliente creado."], 201);
        }
        else
        {
            return "Hijole, yo creo que no se va a poder.";
        }
    }

    public function search($id)
    {
        $cliente = Clientes::find($id);

        if($cliente)
        {
            return response()->json([$cliente], 201);
        }
        else
        {
            return response()->json(['fail' => "Cliente inexistente."]);
        }
    }
}
