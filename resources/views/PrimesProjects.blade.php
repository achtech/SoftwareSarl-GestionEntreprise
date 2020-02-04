<?php use App\Http\Controllers\AdminProjectsController;?>
@extends('crudbooster::admin_template')
@section('content')
<style type="text/css">
    .bl{
        border-left: 3px solid !important;
    }
    .br{
        border-right: 3px solid !important;
    }
    .blr{
        border-left: 3px solid !important;
        border-right: 3px solid !important;
    }
    .bt{
        border-top: 3px solid !important;
    }
    .bb{
        border-bottom: 3px solid !important;
    }
    .bbt{
        border-bottom: 3px solid !important;
        border-top: 3px solid !important;
    }
</style>
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
                              <tr>      <th></th>
                                    @for($i=0;$i<count($projects);$i++)
                                        @if(($i%3===0 && $i!==0))
                                            <th colspan="3" class="blr bbt">Prime</th> 
                                        @endif 
                                        <th colspan="3"  class="blr bbt"><?php echo $projects[$i]->version ?></th>
                                    @endfor                     
                                    <th colspan="3" class="blr bbt">Prime</th>
                                    </tr>                 
                                </thead>    
                                <thead>
                                    <tr><th  class="bb"></th>
                                    @for($i=0;$i<count($projects);$i++)
                                        @if(($i%3===0 && $i!==0))
                                            <th  class="bl bbt">S.C</th>
                                            <th class="bbt">S.Pi</th>
                                            <th class="br bbt">S.Pr</th> 
                                        @endif 
                                            <th class="bl bbt">C</th>
                                            <th class="bbt">Pi</th>
                                            <th class="br bbt">Pr</th> 
                                    @endfor                     
                                            <th  class="bl bbt">S.C</th>
                                            <th class="bbt">S.Pi</th>
                                            <th class="br bbt">S.Pr</th> 
                                </tr>                 
                                </thead>    
                                <tbody>
@for($i=0;$i<count($personnels);$i++)
    <tr>
        <td class="blr">{{$personnels[$i]->nom}}</td> 
        @for($j=0,$k=0;$j<count($projects);$j++)
            @if(($j%3===0 && $j!==0) || $j===count($projects))
             <td style="color:white;background:red">{{$compUser[$i][$k]}}</td> 
             <td style="color:white;background:red">{{$pinaUser[$i][$k]}}</td> 
             <td style="color:white;background:red;border-right: 1px solid black !important;">{{$primUser[$i][$k]}}</td> 
            @endif
            <td>{{$complexityS[$i][$j]}}</td> 
            <td>{{$pinalities[$i][$j]}}</td> 
            <td class="br">{{$primes[$i][$j]}}</td> 
            @if($j===count($projects)-1)
                <?php $k++; ?>
             <td style="color:white;background:red">{{$compUser[$i][$k]}}</td> 
             <td style="color:white;background:red">{{$pinaUser[$i][$k]}}</td> 
             <td style="color:white;background:red;border-right: 1px solid black !important;">{{$primUser[$i][$k]}}</td>

            @endif 
        @endfor
    </tr>
@endfor
<tr><th class="blr bbt">Somme</th>
@for($i=0;$i<count($projects);$i++)
@if(($i%3===0 && $i!==0) || $i===count($projects))
    <td class="bl bbt">Complexity</td> 
    <td class="bbt">Penalité</td> 
    <td class="br bbt">Prime</td> 
@endif                                        
<td class="bl bbt">{{AdminProjectsController::getComplexityProjects($projects[$i]->id)}}</td> 
<td class="bbt">{{AdminProjectsController::getComplexityProjects($projects[$i]->id)}}</td> 
<td class="br bbt">{{AdminProjectsController::getComplexityProjects($projects[$i]->id)}}</td> 
    
@endfor
    <td class="bl bbt">Complexity</td> 
    <td class="bbt">Penalité</td> 
    <td class="br bbt">Prime</td> 
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