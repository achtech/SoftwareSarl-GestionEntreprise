@extends('crudbooster::admin_template')
@section('content')
<br/><br/>
<div id="page-inner"> 
    <div class="row">
        <div class="col-xs-6 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <div class="easypiechart" id="easypiechart-orange" data-percent="55" style="font-size: 45px;width: auto;height: 160px ; text-align:center">                              
                        <a href="{{URL::to('attestation_travail')}}">Attestation<br> de travail</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <div class="easypiechart" id="easypiechart-orange" data-percent="55" style="font-size: 45px;width: auto;height: 160px ; text-align:center">                              
                        <a href="{{URL::to('attestation_emploie')}}">Attestation<br> pôle emploi </a>
                    </div>                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <div class="easypiechart" id="easypiechart-orange" data-percent="45" style="font-size: 45px;width: auto;height: 160px; text-align:center">                              
                        <a href="{{URL::to('accuse_reception')}}">Accusé de réception<br> de lettre de démission</a>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
    
    <div class="row">
        
        <div class="col-xs-6 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <div class="easypiechart" id="easypiechart-orange" data-percent="55" style="font-size: 45px;width: auto;height: 160px  ; text-align:center">                              
                        <a href="{{URL::to('attestation_stage')}}">Attestation <br> de stage</a>
                    </div>
                </div>
            </div>
        </div>        
        <div class="col-xs-6 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <div class="easypiechart" id="easypiechart-orange" data-percent="55" style="font-size: 45px;width: auto;height: 160px  ; text-align:center">                              
                        <a href="{{URL::to('attestation_salaire')}}">Attestation salaire</a>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
    </div><!--/.row-->


@endsection