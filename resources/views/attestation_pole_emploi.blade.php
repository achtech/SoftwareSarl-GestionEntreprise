@extends('crudbooster::admin_template')
@section('content')

<h2>Retirer Votre Attestion Pole Emploi</h2>

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

<div style="float:right;font-size:20px">
App 6 2eme étage  M'HITA <br>espace AL moustapha Semlalia,<br>40000 Marrakech Maroc<br>
Tel : +212 524 449 352<br>
N° RC 58467  <br>
N° de Patente 92110189<br>  
N° Id.fisc 0652837 <br>
</div>
<br style="clear:both">
<p style="font-size: 34px;
    font-weight: bolder;
    text-align: -webkit-center;margin-top:100px">
Attestation de pole d'emploie
 </p>
<p  style="font-size: 22px;"> 
    Madame, Monsieur,
</p>
<p  style="font-size: 22px;"> 
Nous certifions que Monsieur / Madame <b><?php echo $nom ?></b> titulaire de la CIN N° <b><?php echo $cin ?></b> est employé par la société SOFTWARE S.A.R.L dont le siège social est situé à app 6 2eme étage  M'HITA espace AL moustapha Semlalia,40000 Marrakech, en tant que <b><?php echo $qualite ?></b> en contrat à durée indéterminée depuis le <b><?php echo $dateEmbauche ?></b>. jusqu'à ce jour. 
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