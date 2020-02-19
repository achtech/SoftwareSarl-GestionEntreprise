<?php use App\Http\Controllers\HomeController;?>
@extends('crudbooster::admin_template')
@section('content')
<style type="text/css">
.fa-facebook-square {
  background: #3B5998;
  color: white;
}

.fa-twitter-square {
  background: #55ACEE;
  color: white;
}

.fa-google-plus-square {
  background: #dd4b39;
  color: white;
}

.fa-linkedin-square {
  background: #007bb5;
  color: white;
}

</style>
 <div class="panel panel-default">
    <div class="panel-heading">
       Marrakech Team
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                   
                            @foreach($users as $pers)
                           
 <div class="col-md-6" style ="background-color: #f0f0f0">
                                <div class="col-md-6" style="padding: 5px;">
                                 <table style="border-style: none;">
                                  <tr> <td style="width:300px !important;" ><img src="{{$pers['user']->photo}}" id="toChange"  onclick="changeImage()" style="width: 190px;height: 190px;" /><br/><div style="color: #72afd2; font-size:20px;" >{{$pers['user']->name}}<br/></div></td>
                                 
                                  <td><p style="margin-left: 22px;width:250px !important;font-size: 20px; color:#72afd2;"><br/>Report Pointage : {{$pers['pointage']}}<br/></p><p style="margin-left: 22px;width:250px !important;font-size: 20px;color:red;">Report holidays : {{$pers['conge']}}</p></td></tr>
</div></table>

</div>

</div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection