<?php

namespace App\Http\Controllers;

use App\Models\Ordenes;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;

class OrdenesController extends Controller
{
    public function index()
    {
        // Funcion que muestra datos siempre que haya, si no arrojara mensaje indicatorio
        $ordenes = Ordenes::all();
        if(count($ordenes) > 0)        
        {
            return response()->json($ordenes, 201);
        }
        else{
            return response()->json(['cero' => "Registros inexistentes."]);
        }
    }

    public function store(Request $request)
    {
        // Al comienzo usamos 2 variables para usarlos como parte del folio
        // Mediante la funcion mt_rand que nos permite usar aleatoriamente 6 numeros para el folio
        // Ya luego durante el registro de la orden usamos la variable folio para el campo folio
        // Por ultimo, hacemos una consulta buscando registros con ese folio y mostramos en pantalla
        $minimo = 100000;
        $maximo = 999999;
        $numeroAleatorio = mt_rand($minimo,$maximo);
        $folio = 'TEST'.$numeroAleatorio;
        foreach($request->input('items') as $item)
        {
            // Creaa ordenes
            $ordenes = new Ordenes();
            $ordenes->cliente_id = $request->input('cliente_id');
            $ordenes->producto = $item['producto'];
            $ordenes->cantidad = $item['cantidad'];
            $ordenes->fecha_pedido = Carbon::now()->format('Y-m-d');
            $ordenes->folio = $folio;
            $ordenes->save();
        }
        $folios = Ordenes::where('folio',$folio)->get();
        if(count($folios) > 0)
        {
            return response()->json(['folio' => $ordenes->folio], 201);
        }
        else
        {
            return "Hijole, yo creo que no se va a poder.";
        }
    }

    public function search_id($id)
    {
        // Buscamos registros de ordenes que coincidan con ids de clientes
        $orden_id = Ordenes::where('cliente_id',$id)->get();

        if(count($orden_id) > 0)
        {
            return response()->json([$orden_id], 201);
        }
        else
        {
            return response()->json(['fail' => "Cliente sin registros."]);
        }
    }
    public function search_folio($folio)
    {
        // Buscamos las ordenes que tengan el folio dado, proceso similar al buscar por id
        $folio = Ordenes::where('folio',$folio)->get();

        if(count($folio) > 0)
        {
            return response()->json([$folio], 201);
        }
        else
        {
            return response()->json(['fail' => "Folio inexistente."]);
        }
    }
}
