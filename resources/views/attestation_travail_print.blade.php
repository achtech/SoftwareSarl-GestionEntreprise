<!DOCTYPE html>
<html>
<head>
    <title>Print</title>
</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div style="float:left">
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
                                        Attestation de travail
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Madame, Monsieur,
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Nous certifions que Monsieur / Madame <b>{{ $selectedUser->name }}</b> titulaire de la CIN N° <b>{{ $selectedUser->cin }}</b> est employé par la société SOFTWARE S.A.R.L dont le siège social est situé à app 6 2eme étage  M'HITA espace AL moustapha Semlalia,40000 Marrakech, en tant que <b> {{ $selectedUser->Libelle }} </b> en contrat à durée indéterminée depuis le <b>{{ $selectedUser->hiring_date }}</b>. jusqu'à ce jour. 
                                </p>
                                <p  style="font-size: 22px;"> 
                                    La présente attestation est délivrée à l’intéressé sur sa demande pour servir et valoir ce que de droit.<br>
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Nous vous prions de croire, Madame, Monsieur, à l’expression de nos salutations distinguées.<br>
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Fait à Marrakech: <br>
                                    le <?php echo date("d-m-Y") ?>,
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>