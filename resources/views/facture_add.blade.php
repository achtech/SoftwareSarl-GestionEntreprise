<?php use App\Http\Controllers\AdminCongesController;?>
@extends('crudbooster::admin_template')
@section('content')
        <div class="panel panel-default">
            <div class="panel-heading">
                Entete de la facture
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-body">
                                 <form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-4">
                                             <div class="form-group">
                                                 <label>Réf Client</label>
                                                 <input type="text" name="ref_clients" class="form-control"></input>
                                             </div>
                                             </div>
                                            <div class="col-md-4">
                                              <div class="form-group">
                                                 <label>Numero De la facture</label>
                                                 <input type="text" name="num_facture"  class="form-control"></input>
                                             </div>
                                             </div>
                                            <div class="col-md-4">
                                              <div class="form-group">
                                                 <label>Date facture</label>
                                                 <input type="date" name="date_facture" class="form-control"></input>
                                             </div>
                                             </div>
                                         </div>
                                    </div>
                                 </form>                 
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </div>

@endsection