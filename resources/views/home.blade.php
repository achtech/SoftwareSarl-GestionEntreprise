<?php use App\Http\Controllers\HomeController;?>
@extends('crudbooster::admin_template')
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        Team
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            @foreach($users as $pers)
                                <div class="col-md-3" style="height: 300px;background: lightgray;border: 1px solid grey;margin: 10px;padding: 10px;"><img src="{{$pers->photo}}" style="width: 200px;height: 200px;" /><br/>{{$pers->name}}<br/><hr>Report Pointage : {{HomeController::getReport($pers->id)}}</div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection