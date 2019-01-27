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
                                        Attestation d'emploie
                                </p>
                               <p  style="font-size: 22px;"> 
je soussigné(e) Monsieur/Madamme <b>{{ $selectedUser->name }}</b> titulaire de la CIN N° <b>{{ $selectedUser->cin }} </b> demeurant à  
<b>{{ $selectedUser->adress }} </b>reconnais avoir reçu de la société SOFTWARE S.A.R.L la somme de  <input type="text" name="user_id" value="{{ old('user_id', $user->user_id)}}" >cette somme n'a été versée, pour solde de tout compte ,en paiement de :
<p style="font-size: 22px;" >
-Salaire <input type="text"> au <input type="text">.</p>
<p style="font-size: 22px;" >
-Solde des congés payés depuis le <input type="text"> jusqu'à le <input type="text">
</p>
<p style="font-size: 22px;" >
Ce reçu de solde de tout compte a été établi en deux exemplaire,dont un m'a été remis.</p>
</p>
                                <p  style="font-size: 22px;"> 
                                    Fait à Marrakech <br>
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