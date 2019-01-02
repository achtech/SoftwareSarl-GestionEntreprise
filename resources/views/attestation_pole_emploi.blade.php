@extends('crudbooster::admin_template')
@section('content')

<h2>Retirer Votre Attestion Pole Emploi</h2>
<form action="attestation_pole_emploi" method="Post"  name="f1">
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
                          
                               
<div style="float:left">

             <form action="admin/attestation_emploi_print"  method = "get" name="frm"  onsubmit="return checkForm(document.frm);" >
<input type="hidden" name="idPersonnels" value="{{$selectedUser->id}}"/>
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
Reçu pour solde de tout compte
 </p>
<p  style="font-size: 22px;"> 
    Madame, Monsieur,
</p>
<p  style="font-size: 22px;"> 
je soussigné(e) Monsieur/Madamme <p>{{ $selectedUser->name }}</p> titulaire de la CIN N° <p>{{ $selectedUser->cin }}</p> demeurant à <p> {{ $selectedUser->adress }} </p> reconnais avoir reçu de la société SOFTWARE S.A.R.L la somme de  <p><input type="text"></p>cette somme n'a été versée, pour solde de tout compte ,en paiement de :
-Salaire <p><input type="text"></p> au <p><input type="text"></p>.
-Solde des congés payés depuis le <p><input type="text"></p> jusqu'à le <p><input type="text"></p>
Ce reçu de solde de tout compte a été établi en deux exemplaire,dont un m'a été remis.
</p>
<p  style="font-size: 22px;"> 
Fait à Marrakech <br>
le <?php echo date("d-m-Y") ?>,
</p>
                                </div>
                                </div>
                               <div class="col-lg-12">
                                <br/>
<input  type="submit" class="btn btn-primary" style="margin-left:1500px" value = "Imprimer"></input>
 </div>
                        </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
@endsection
