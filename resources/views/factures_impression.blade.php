@extends('crudbooster::admin_template')
@section('content')
<form action="../factures" method="post" >
    {{ csrf_field() }}
    <input type="hidden" name="id" value="{{$factures->id}}">
    <input type="submit" id="btSubmit" name="btSubmit" value="Imprimer">
</form>
<div id="widget">
<div class="box">
    <div style="margin:50px;font-size: 24px">
        
    <div style="float:left;">
        {{$software->social_reason}}<br>
        {{$software->adress}}<br>
        {{$software->zip_code}} Marrakech<br>
        Maroc<br>
    </div>
    <div style="float:right;">
    <h2>Facture</h2>
        Date :{{$factures->date_facture}}<br>
        Reference Client:{{$factures->ref_clients}}<br>
        N° facture:{{$factures->num_facture}}<br>
        {{$clients->social_reason}}<br>
        {{$clients->adress}}<br>
    </div>
    <br style="clear: both;">
    <div style="padding-top: 40px;">
        <table width="100%" border="1" style="border: 1px;margin-bottom: 100px;">
            <thead>
            <tr>
                <th style="width: 250px;padding: 10px">Réference</th>
                <th style="padding: 10px">Description</th>
                <th style="width: 200px;padding: 10px">Prix unitaire</th>
                <th style="width: 150px;padding: 10px">Qté</th>
                <th style="width: 150px;padding: 10px">Montant</th>
            </tr>
            </thead>
            <tbody>
                @foreach($factures_projects as $fp)
            <tr>
                <td style="padding: 10px">{{$fp->nom}}</td>
                <td style="padding: 10px">{{$fp->version}}</td>
                <td style="padding: 10px; text-align: center;">{{$fp->prix_unitaire}}</td>
                <td style="padding: 10px; text-align: right;">{{$fp->nombre_heurs}}</td>
                <td style="padding: 10px;text-align: right;">{{$fp->total}}</td>
            </tr>
            @endforeach
            @php 
                $ct = 5- count($factures_projects);
            @endphp
            @for($i=0;$i<$ct;$i++)
            <tr height="35" >
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            @endfor
            </tbody>
            <tfoot>
            <tr>
                <th colspan="4" style="text-align: right !important;padding: 10px">Total Hors Taxes</th>
                <th style="padding: 10px">{{$factures->total_hors_taxe}}</th>
            </tr>
            <tr>
                <th colspan="4"style="text-align: right !important;padding: 10px">Montant Total</th>
                <th style="padding: 10px">{{$factures->total}}</th>
            </tr>
            </tfoot>
        </table>
    </div>
    <hr style="width: 90%;background: brown;height: 5px">
    <div><center>
        Software SARL • App 6 2eme étage M'HITA espace AL moustapha Semlalia,40000 Marrakech Maroc<br>
N° RC 58467 • N° de Patente 92110189 • N° Id.fisc 06528370
    </center></div>

    </div>
    </div>

    <div class="box">
    <div style="margin:50px;font-size: 24px">
        
    <div style="float:left;">
        {{$software->social_reason}}<br>
        {{$software->adress}}<br>
        {{$software->zip_code}} Marrakech<br>
        Maroc<br>
    </div>
    <div style="float:right;">
    <h2>Facture</h2>
        Date :{{$factures->date_facture}}<br>
        Reference Client:{{$factures->ref_clients}}<br>
        N° facture:{{$factures->num_facture}}<br>
        {{$clients->social_reason}}<br>
        {{$clients->adress}}<br>
    </div>
    <br style="clear: both;">
    <div style="padding-top: 40px;">
        <table width="100%" border="1" style="border: 1px;margin-bottom: 100px;">
            <thead>
            <tr>
                <th style="padding: 10px">Réf client</th>
                <th style="padding: 10px">Réf interne</th>
                <th style="padding: 10px">Complexity</th>
                <th style="padding: 10px">Nombre d'heurs</th>
            </tr>
            </thead>
            <tbody>
                @php
                    $sumHours = 0;
                @endphp
                @foreach($factures_tasks as $ft)

                @php
                    $sumHours = $sumHours+$ft->complexity*4;
                @endphp
            <tr>
                <td style="padding: 10px">{{$ft->Ref_client}}</td>
                <td style="padding: 10px; text-align: center;">{{$ft->Ref_interne}}</td>
                <td style="padding: 10px; text-align: right;">{{$ft->complexity}}</td>
                <td style="padding: 10px;text-align: right;">{{$ft->complexity*4}}</td>
            </tr>
            @endforeach
            </tbody>
            <tfoot>
            <tr>
                <th colspan="3" style="text-align: right !important;padding: 10px">Sum of Worked hours</th>
                <th style="padding: 10px">{{$sumHours}}</th>
            </tr>
            <tr>
                <th colspan="3"style="text-align: right !important;padding: 10px">Montant total</th>
                <th style="padding: 10px">{{$factures->total}}</th>
            </tr>
            </tfoot>
        </table>
    </div>
    <hr style="width: 90%;background: brown;height: 5px">
    <div><center>
        Software SARL • App 6 2eme étage M'HITA espace AL moustapha Semlalia,40000 Marrakech Maroc<br>
N° RC 58467 • N° de Patente 92110189 • N° Id.fisc 06528370
    </center></div>

    </div>
    </div>

@endsection