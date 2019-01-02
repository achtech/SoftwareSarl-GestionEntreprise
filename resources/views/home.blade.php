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
                            <?php $tab = ['#b8c5e9','#ef8c8e','#e4a392','#fae8e8','#d9d8e9','#faf9fe']; ?>
                            @foreach($users as $i=>$pers)
                                <?php $color=$tab[$i]; ?>
                                <div class="col-md-2" style="background: <?php echo $color; ?>;border: 1px solid grey;padding: 5px;"><img src="{{$pers['user']->photo}}" style="width: 190px;height: 190px;" /><br/>{{$pers['user']->name}}<br/>Report Pointage : {{$pers['pointage']}}<br/>Report holidays : {{$pers['conge']}}</div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection