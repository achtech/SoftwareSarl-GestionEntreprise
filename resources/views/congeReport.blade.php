<?php use App\Http\Controllers\AdminCongesController;?>
@extends('crudbooster::admin_template')
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        Conge Report
    </div>
    <div class="panel-body">
        <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <th>Nom</th>
                                     @for($year=2014;$year<=date('Y');$year++)
                                        <th colspan="2"><?php echo $year ?></th>
                                    @endfor
                                </thead>
                                <thead>
                                    <th></th>
                                    @for($year=2014;$year<=date('Y');$year++) 
                                        <th>Somme</th>
                                        <th>Reste</th>
                                    @endfor
                                </thead>    
                                <tbody>
                                    @for($i=0;$i<count($personnels);$i++)
                                        <tr >
                    <td>{{$personnels[$i]->name}}</td> 
                        @for($j=2014;$j<=date('Y');$j++)
                            <td>{{AdminCongesController::getNombreJourCongePri($personnels[$i]->id,$j)}}</td>
                            <td>{{AdminCongesController::getNombreJourCongeCredit($personnels[$i]->id,$j)}}</td> 
                        @endfor
                    </tr>
                                        @endfor
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    </div>
</div>

@endsection