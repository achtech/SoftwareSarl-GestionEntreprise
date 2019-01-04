@extends('crudbooster::admin_template')
@section('content')

<h2>Retirer Votre Attestion De Stage</h2>

<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form action="" name="frm" method="post" >
                                
                                
                       </form>
<div style="float:left">

             <form action="gestion.php" name="frm" method="post" 
                                  onsubmit="return checkForm(document.frm);" >
                                <input type="hidden" name="act" value="generer_attestation_de_travail"/>
                                <input type="hidden" name="page" value="conges.php"/>
               
    <img src="../storage/app/myImages/Logo.jpg">  

<div style="float:right;font-size:20px" >    
{{ $en->adress }} <br>
{{ $en->rue }},<br>
{{$en->zip_code}} {{$en->city}} <br>
Tel : {{ $en->mobile }}<br>
N° RC : {{ $en->rc }}  <br>
N° de Patente : {{ $en->patente }}<br>  
N° Id.fisc : {{ $en->idfisc }} <br>
</div>
<br style="clear:both">
<p style="font-size: 34px;
    font-weight: bolder;
    text-align: -webkit-center;margin-top:100px">
Accusé de récéption de lettre de démission
 </p>
<p  style="font-size: 22px;"> 
    Madame, Monsieur,
</p>
<p  style="font-size: 22px;"> 
je soussigné(e) Monsieur /Madamme  <b>{{ $selectedUser->name }}</b> titulaire de la CIN N° <b><?php echo $cin ?></b>  et immatriculé à la CNSS sous le numéro <b>{{ $selectedUser->name }}</b> demeurant à <b>{{ $selectedUser->name }}</b> a été salarié(e) de notre socété du <b>{{ $selectedUser->name }}</b> au <b>{{ $selectedUser->name }}</b> en qualite de développeur de logiciel.
</p>
</p>
<p  style="font-size: 22px;"> 
Fait à Marrakech <br>
le <?php echo date("d-m-Y") ?>,
</p>
                                </div>
                                </div>
                               <div class="col-lg-12">
                            	<br/>
<button type="button" class="btn btn-primary" style="margin-left:1500px">Imprimer</button>
 </div>
                        </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
@endsection