@extends('crudbooster::admin_template')
@section('content')

<h2>Retirer Votre Accusé De Reception </h2>
       
<form action="accuse_reception" method="Post"  name="f1">
    {{ csrf_field() }}
<select name="idPersonnels"  id="idPersonnels" class="form-control" onchange="document.f1.submit()">
        <option >Veuillez choisir une personne</option> 
        @foreach($personnels as $user) 
        <?php 
        $selected=''; 
        if(!empty($selectedUser) && $user->id==$selectedUser->id) $selected="selected='selected'";?>
        <option value="{{ $user->id }}" {{$selected}} >{{ $user->name }}</option> 
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
                            <form action="" name="frm" method="post" >
                                
                                
                       </form>
<div style="float:left">

             <form action="admin/accuse_reception_print" method = "get" name="frm" 
                                  onsubmit="return checkForm(document.frm);" >
                                 <input type="hidden" name="idPersonnels" value="{{$selectedUser->id}}"/>                        
               
    <img src="../storage/app/myImages/Logo.jpg">  

</div>

<div style="float:right;font-size:20px" >

      
{{ $en->adress }} <br>
{{$en->zip_code}} ,{{$en->city}} <br>
Tel : {{ $en->mobile }}<br>
N° RC : {{ $en->rc }}  <br>
N° de Patente : {{ $en->patente }}<br>  
N° Id.fisc : {{ $en->idfisc }} <br>
</div>
<br style="clear:both">
<p style="font-size: 34px;
    font-weight: bolder;
    text-align: -webkit-center;margin-top:100px">
Accusé de Réception de lettre de démission
 </p>
<p  style="font-size: 22px;"> 
    Madame, Monsieur,
</p>
<p  style="font-size: 22px;"> 
Nous certifions que Monsieur / Madame <b>{{ $selectedUser->name }}</b> titulaire de la CIN N° <b>{{ $selectedUser->cin }}</b> est employé par la société SOFTWARE S.A.R.L dont le siège social est situé à app 6 2eme étage  M'HITA espace AL moustapha Semlalia,40000 Marrakech, en tant que <b>{{ $selectedUser->Libelle }}</b> en contrat à durée indéterminée depuis le <b>{{ $selectedUser->hiring_date }}</b>. jusqu'à ce jour. 
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
<input  type="submit" class="btn btn-primary"  value = "Imprimer"></input>
 </div>

                        </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

@endsection