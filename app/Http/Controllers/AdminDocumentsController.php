<?php namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
	use Session;
	//use Request;
	use Dompdf\Dompdf;
	use DB;
	use CRUDBooster;

	class AdminDocumentsController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "title";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "documents";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Users","name"=>"id_users","join"=>"cms_users,id"];
			$this->col[] = ["label"=>"Title","name"=>"title"];
			$this->col[] = ["label"=>"Document","name"=>"document"];
			$this->col[] = ["label"=>"Date Impression","name"=>"date_impression"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'users,id'];
			$this->form[] = ['label'=>'Title','name'=>'title','type'=>'text','validation'=>'required|string|min:3|max:70','width'=>'col-sm-10','placeholder'=>'You can only enter the letter only'];
			$this->form[] = ['label'=>'Document','name'=>'document','type'=>'filemanager','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Date Impression','name'=>'date_impression','type'=>'datetime','validation'=>'required|date_format:Y-m-d H:i:s','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'users,id'];
			//$this->form[] = ['label'=>'Title','name'=>'title','type'=>'text','validation'=>'required|string|min:3|max:70','width'=>'col-sm-10','placeholder'=>'You can only enter the letter only'];
			//$this->form[] = ['label'=>'Document','name'=>'document','type'=>'filemanager','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Date Impression','name'=>'date_impression','type'=>'datetime','validation'=>'required|date_format:Y-m-d H:i:s','width'=>'col-sm-10'];
			# OLD END FORM

			/* 
	        | ---------------------------------------------------------------------- 
	        | Sub Module
	        | ----------------------------------------------------------------------     
			| @label          = Label of action 
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class  
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        | 
	        */
	        $this->sub_module = array();


	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)     
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        | 
	        */
	        $this->addaction = array();


	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Button Selected
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button 
	        | Then about the action, you should code at actionButtonSelected method 
	        | 
	        */
	        $this->button_selected = array();

	                
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------     
	        | @message = Text of message 
	        | @type    = warning,success,danger,info        
	        | 
	        */
	        $this->alert        = array();
	                

	        
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add more button to header button 
	        | ----------------------------------------------------------------------     
	        | @label = Name of button 
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        | 
	        */
	        $this->index_button = array();



	        /* 
	        | ---------------------------------------------------------------------- 
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------     
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
	        | 
	        */
	        $this->table_row_color = array();     	          

	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | You may use this bellow array to add statistic at dashboard 
	        | ---------------------------------------------------------------------- 
	        | @label, @count, @icon, @color 
	        |
	        */
	        $this->index_statistic = array();



	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = NULL;


            /*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code before index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
	        $this->pre_index_html = null;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code after index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
	        $this->post_index_html = null;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include Javascript File 
	        | ---------------------------------------------------------------------- 
	        | URL of your javascript each array 
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
	        $this->load_js = array();
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Add css style at body 
	        | ---------------------------------------------------------------------- 
	        | css code in the variable 
	        | $this->style_css = ".style{....}";
	        |
	        */
	        $this->style_css = NULL;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include css File 
	        | ---------------------------------------------------------------------- 
	        | URL of your css each array 
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
	        $this->load_css = array();
	        
	        
	    }
	     public function getEmployeData($id){
	    	$data = [];
	    	$data['personnels'] = DB::table('personnels')->where('id',$id)->first();
	    	return $data;
	    }

	    public function printpdf(Request $request)
	    {
		    $pdf = \App::make('dompdf.wrapper');
		    $pdf->loadHTML($this->getHtmlPageAttestationTravail($request));
	    	return $pdf->stream();
	    }
 public function printpdfofAttesstationEmploi(Request $request)
	    {
		    $pdf = \App::make('dompdf.wrapper');
		    $pdf->loadHTML($this->getHtmlPageAttestationEmploi($request));
	    	return $pdf->stream();
	    }
	   public function getHtmlPageAttestationTravail(Request $request){
			$selectedUser = DB::table('personnels')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
			->where('id_users' ,'=',$request->input('idPersonnels'))->first();
      		$en = DB::table('entreprises')->first();
			
			$out = '<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div style="float:left">
                                <img src="../storage/app/myImages/Logo.jpg" width="350px">  
                                <div style="float:right;font-size:20px" >
                                    '.$en->adress.'<br>
                                    '. $en->rue.'<br>
                                    '. $en->zip_code.' '. $en->city.' <br>
                                    Tel : '. $en->mobile.'<br>
                                    N° RC : '. $en->rc.'  <br>
                                    N° de Patente : '. $en->patente.'<br>  
                                    N° Id.fisc : '. $en->idfisc.' <br>
                                </div>
                                <br style="clear:both">
                                <p style="font-size: 34px;
                                    font-weight: bolder;
                                    text-align:center;margin-top:100px">
                                        Attestation de travail
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Madame, Monsieur,
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Nous certifions que Monsieur / Madame <b>'. $selectedUser->name.'</b> titulaire de la CIN N° <b>'. $selectedUser->cin.'</b> est employé par la société SOFTWARE S.A.R.L dont le siège social est situé à app 6 2eme étage  M HITA espace AL moustapha Semlalia,40000 Marrakech, en tant que <b> '. $selectedUser->Libelle.' </b> en contrat à durée indéterminée depuis le <b>'. $selectedUser->hiring_date.'</b>. jusqu à ce jour. 
                                </p>
                                <p  style="font-size: 22px;"> 
                                    La présente attestation est délivrée à l’intéressé sur sa demande pour servir et valoir ce que de droit.<br>
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Nous vous prions de croire, Madame, Monsieur, à l’expression de nos salutations distinguées.<br>
                                </p>
                                <p  style="font-size: 22px;"> 
                                    Fait à Marrakech <br>
                                    le '.now().',
                                </p>
                                <p  style="font-size: 22px; margin-left:450px ; margin-bottom:55px;"> 
                                   Signature,
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
';
			return $out;
		}

	   public function getHtmlPageAttestationEmploi(Request $request){
			$selectedUser = DB::table('personnels')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
			->where('id_users' ,'=',$request->input('idPersonnels'))->first();
      		$en = DB::table('entreprises')->first();
			
			$out = '<div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div style="float:left">
                                <img src="../storage/app/myImages/Logo.jpg" width="350px">  
                                <div style="float:right;font-size:20px" >
                                    '.$en->adress.'<br>
                                    '. $en->rue.'<br>
                                    '. $en->zip_code.' '. $en->city.' <br>
                                    Tel : '. $en->mobile.'<br>
                                    N° RC : '. $en->rc.'  <br>
                                    N° de Patente : '. $en->patente.'<br>  
                                    N° Id.fisc : '. $en->idfisc.' <br>
                                </div>
                                <br style="clear:both">
                                <p style="font-size: 34px;
                                    font-weight: bolder;
                                    text-align:center;margin-top:100px">
                                        Attestation d emploie 
                                </p>
                               <p  style="font-size: 22px;"> 
je soussigné(e) Monsieur/Madamme <b>'.$selectedUser->name.'</b> titulaire de la CIN N° <b>'.$selectedUser->cin.' </b> demeurant à  
<b>'.$selectedUser->adress.' </b>reconnais avoir reçu de la société SOFTWARE S.A.R.L la somme de  <b>'.$request->input('salary').' </b> cette somme n a été versée, pour solde de tout compte ,en paiement de :
<p style="font-size: 22px;" >
-Salaire <b> '.$request->input('salary').' </b> au <b> '.$request->input('netSalary').' </b> </p>
<p style="font-size: 22px;" >
-Solde des congés payés depuis le <b>'.$request->input('conge').' </b> jusqu  à le <b>'.$request->input('endConge').'</b>
</p>
<p style="font-size: 22px;" >
Ce reçu de solde de tout compte a été établi en deux exemplaire,dont un m \'a été remis.</p>
</p>
                                <p  style="font-size: 22px;"> 
                                    Fait à Marrakech <br>
                                    le '.now().',
                                </p>
                                <p  style="font-size: 22px; margin-left:450px ; margin-bottom:55px;"> 
                                   Signature,
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
';
			return $out;
		}



/*	   public function printpdf(Request $request){
			$data['selectedUser'] = DB::table('personnels')->where('id_users' ,'=',$request->input('idPersonnels'))->first();
      		$data['en'] = DB::table('entreprises')->first();
			$file = '\admin\attestation_travail_print';
     		//dd($file);
     		dd(public_path().$file);
     		$html = file_get_contents(public_path().$file);

		    //$this->cbView('attestation_travail_print');
		    //$pdf = new Dompdf();
		    //$pdf->set_option('defaultFont', 'Courier');
		    //$pdf = \App::make('dompdf.wrapper');
		    // $pdf->loadHtmlFile($file);
		    // return $pdf->stream();
      		// instantiate and use the dompdf class
			$dompdf = new Dompdf();
			$dompdf->loadHtmlFile($html);
			$dompdf->setPaper('A4', 'landscape');

			// Render the HTML as PDF
			$dompdf->render();

			// Output the generated PDF to Browser
			$dompdf->stream();
		}
*/

      public function getAdd(){
         	$data['page_title'] = 'Ajouter Un Document Administratif';
         	$this->cbView('add_document',$data);
         }

         public function getUser(Request $request){
         	$nameEmploye = $request->input('nameEmploye');
			$data['personnels'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->select('personnels.*', 'cms_users.name','professions.Libelle')
         	->get();         	
         	$data['selectedUser'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            //->select('personnels.*', 'cms_users.name as name','professions.libelle as libelle')
            ->where('cms_users.id',$request->input('idPersonnels'))
         	->first();
         	 $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_travail',$data); 

         }
         public function getAttestationStage(Request $request){
         	$nameEmploye = $request->input('nameEmploye');
			$data['personnels'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->select('personnels.*', 'cms_users.name','professions.Libelle')
         	->get();         	
         	$data['selectedUser'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            //->select('personnels.*', 'cms_users.name as name','professions.libelle as libelle')
            ->where('cms_users.id',$request->input('idPersonnels'))
         	->first();
         	 $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_stage',$data); 

         }

         public function getUserToGetAttestationEmploi(Request $request){
         	$nameEmploye = $request->input('nameEmploye');
			$data['personnels'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->select('personnels.*', 'cms_users.name','professions.Libelle')
         	->get();         	
         	$data['selectedUser'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            //->select('personnels.*', 'cms_users.name as name','professions.libelle as libelle')
            ->where('cms_users.id',$request->input('idPersonnels'))
         	->first();
         	 $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_pole_emploi',$data); 

         }
         public function goToAttestationTravail(){ 

         	$data['personnels'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->select('personnels.*', 'cms_users.name','professions.Libelle')
         	->get();
             $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_travail',$data); 
         }
        
         public function goToAttestationPoleEmploie(){ 
         	$data['personnels'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->select('personnels.*', 'cms_users.name','professions.Libelle')
         	->get();
            $data['en'] = DB::table('entreprises')->first();        
         	  	return view('attestation_pole_emploi',$data); 
         }
         public function goToBulletinPaie(){ 
            $data['en'] = DB::table('entreprises')->first();
         	return view('bulletin_paie',$data); 
         }
         public function getAttestationSalaire(){ 
      	    $nameEmploye = $request->input('nameEmploye');
			$data['personnels'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            ->select('personnels.*', 'cms_users.name','professions.Libelle')
         	->get();         	
         	$data['selectedUser'] = DB::table('personnels')
            ->join('cms_users', 'cms_users.id', '=', 'personnels.id_users')
            ->join('professions', 'professions.id', '=', 'personnels.id_professions')
            //->select('personnels.*', 'cms_users.name as name','professions.libelle as libelle')
            ->where('cms_users.id',$request->input('idPersonnels'))
         	->first();
         	 $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_salaire',$data);  
         }
          public function goToAttestationSalaire(){ 
            $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_salaire',$data); 
         }
         public function goToAttestationStage(){ 
            $data['en'] = DB::table('entreprises')->first();
         	return view('attestation_stage',$data); 
         }
         public function goToAccuseReception(){ 
            $data['en'] = DB::table('entreprises')->first();
         	return view('accuse_reception',$data); 
         }

         

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for button selected
	    | ---------------------------------------------------------------------- 
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here
	            
	    }


	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
	    public function hook_query_index(&$query) {
	        //Your code here
	            
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */    
	    public function hook_row_index($column_index,&$column_value) {	        
	    	//Your code here
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after add public static function called 
	    | ---------------------------------------------------------------------- 
	    | @id = last insert id
	    | 
	    */
	    public function hook_after_add($id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_edit(&$postdata,$id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_edit($id) {
	        //Your code here 

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_delete($id) {
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_delete($id) {
	        //Your code here

	    }



	    //By the way, you can still create your own method in here... :) 


	}