<?php use App\Http\Controllers\AdminProjectsController;?>
@extends('crudbooster::admin_template')
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        Prime project report
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
                                    <th></th>
                                    @for($i=0;$i<count($projects);$i++)
                                        @if(($i%3===0 && $i!==0) || $i===count($projects))
                                            <th>Prime</th> 
                                        @endif 
                                        <th><?php echo $projects[$i]->version ?></th>
                                    @endfor                                     
                                </thead>    
                                <tbody>
                                    @for($i=0;$i<count($personnels);$i++)
                                        <tr>
                                            <td>{{$personnels[$i]->nom}}</td> 
                                            @for($j=0,$k=0;$j<count($projects);$j++)
                                    @if(($j%3===0 && $j!==0) || $j===count($projects))
                                        <td style="color:white;background:red">{{$primeUser[$i][$k]}}<?php $k++; ?></td> 
                                                @endif 
                                                <td>{{$prime[$i][$j]}}</td> 
                                            @endfor
                                        </tr>
                                    @endfor
                                    <tr><th>Somme</th>
                                    @for($i=0;$i<count($projects);$i++)
                                    @if(($i%3===0 && $i!==0) || $i===count($projects))
                                        <td>Prime</td> 
                                    @endif                                        
                                    <td>{{AdminProjectsController::getComplexityProjects($projects[$i]->id)}}</td> 
                                        
                                    @endfor
                                    </tr>
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