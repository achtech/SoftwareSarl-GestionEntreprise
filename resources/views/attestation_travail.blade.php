@extends('crudbooster::admin_template')
@section('content')

<h2>Retirer Votre Attestion De Travail</h2>
<form action="AdminDocumentsController@getUser"   method="post"  >

 <select name="nameEmploye"  id="nameEmploye" class="form-control" >
        @foreach($personnels as $nameEmploye) 
        <option value="{{ $nameEmploye->id }}" >  {{ $nameEmploye->name }}</option> 
        @endforeach
     
    </select>
</form>
    <br/>
<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                          
                               
<div style="float:left">

             <form action="gestion.php" name="frm" method="post" 
                                  onsubmit="return checkForm(document.frm);" >
                                <input type="hidden" name="act" value="generer_attestation_de_travail"/>
                                <input type="hidden" name="page" value="conges.php"/>
               
   <img src="../storage/app/myImages/Logo.jpg">  

@foreach($entreprises as $entreprise) 
<div style="float:right;font-size:20px" >

      
{{ $entreprise->adress }} <br>
{{ $entreprise->rue }},<br>
{{$entreprise->zip_code}} {{$entreprise->city}} <br>

Tel : {{ $entreprise->mobile }}<br>
N° RC : {{ $entreprise->rc }}  <br>
N° de Patente : {{ $entreprise->patente }}<br>  
N° Id.fisc : {{ $entreprise->idfisc }} <br>
</div>
  @endforeach
<br style="clear:both">
<p style="font-size: 34px;
    font-weight: bolder;
    text-align: -webkit-center;margin-top:100px">
Attestation de travail
 </p>
<p  style="font-size: 22px;"> 
    Madame, Monsieur,
</p>
<p  style="font-size: 22px;"> 
Nous certifions que Monsieur / Madame <b>{{ $nameEmploye->name }}</b> titulaire de la CIN N° <b>{{ $nameEmploye->cin }}</b> est employé par la société SOFTWARE S.A.R.L dont le siège social est situé à app 6 2eme étage  M'HITA espace AL moustapha Semlalia,40000 Marrakech, en tant que <b> {{ $nameEmploye->Libelle }} </b> en contrat à durée indéterminée depuis le <b>{{ $nameEmploye->hiring_date }}</b>. jusqu'à ce jour. 
</p>
<p  style="font-size: 22px;"> 
La présente attestation est délivrée à l’intéressé sur sa demande pour servir et valoir ce que de droit.<br>
</p>
<p  style="font-size: 22px;"> 
Nous vous prions de croire, Madame, Monsieur, à l’expression de nos salutations distinguées.<br>
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
