<?php use App\Http\Controllers\AdminCongesController;?>
@extends('crudbooster::admin_template')
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        Status des salaries
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
                                    <th>Salaire net</th>
                                    <th>Prime</th>
                                    <th>Nombre d'heure</th>
                                    <th>Congé:Motif</th>
                                </thead>
                                <tfoot>
                                    <th>Nom</th>
                                    <th>Salaire net</th>
                                    <th>Prime</th>
                                    <th>Nombre d'heure</th>
                                    <th>Congé:Motif</th>
                                </tfoot>    
                                <tbody>
                                    @for($i=0;$i < count($personnels);$i++)
                                        <tr >
                            <td>{{$personnels[$i]->name}}</td> 
                            <td>{{$personnels[$i]->net_salary. ".00 Dh"}}</td> 
                            <td>{{AdminCongesController::getPrime($personnels[$i]->id,date('m'),date('Y'))}}</td> 
                            <td>{{AdminCongesController::getNbrHeurs($personnels[$i]->id,date('m'),date('Y'))}}</td> 
                            <td>{{AdminCongesController::getMotif($personnels[$i]->id,date('m'),date('Y'))}}</td> 
                    </tr>
                                        @endfor
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    <a  href="statusSalarie/printpdf" class="btn btn-primary">Imprimer</a>
    </div>
</div>

@endsection