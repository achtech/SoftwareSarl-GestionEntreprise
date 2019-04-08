<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;


	class AdminFacturesController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
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
			$this->table = "factures";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Num Facture","name"=>"num_facture"];
			$this->col[] = ["label"=>"Client","name"=>"(select  social_reason from clients  where id =1) as clientName"];
			$this->col[] = ["label"=>"Date Facture","name"=>"date_facture"];
			$this->col[] = ["label"=>"Ref Clients","name"=>"ref_clients"];
			$this->col[] = ["label"=>"Projects","name"=>"id","callback_php"=>'$this->getProjectsByFactures($row->id)'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Date Facture','name'=>'date_facture','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Ref Clients','name'=>'ref_clients','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Num Facture','name'=>'num_facture','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Projects','name'=>'id_projects','type'=>'select2','width'=>'col-sm-10','datatable'=>'projects,version','relationship_table'=>'factures_projects','datatable_format'=>'nom,\' ---> \',version'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Date Facture','name'=>'date_facture','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Ref Clients','name'=>'ref_clients','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Num Facture','name'=>'num_facture','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Projects','name'=>'id_projects','type'=>'select2','width'=>'col-sm-10','datatable'=>'projects,version','relationship_table'=>'factures_projects','datatable_format'=>'nom,\' ---> \',version'];
			//$this->form[] = ['label'=>'Totla Hors Taxe','name'=>'totla_hors_taxe','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Total','name'=>'total','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
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
	        $this->addaction[] = [
        		'title' =>'Imprimer' , 'url' => 'factures_impression/[id]',
        		'icon' => 'fa fa-print', 'color' => 'success'
			];



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

	/*    public function getAdd(){
	    	$data['page_title'] = 'Ajouter une facture';
	    	$this->cbView('facture_add',$data);
	    }
*/
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
	        //details_factures : id_factures,id_tasks
	        //factures_projects : nombre_heurs,total,prix_unitaire
	        //factures : total_hors_taxe,total
	        /*get list of Done tasks */
	        $done = DB::table('tasks')
	        		->join('modules','modules.id',"tasks.id_modules")
	        		->join('projects','projects.id','modules.id_projects')
	        		->join('factures_projects','factures_projects.id_projects','projects.id')
	        		->select('tasks.id as tasksId','tasks.status as status','tasks.complexity as complexity','projects.id as id_projects','projects.prix_unitaire as prix_unitaire','factures_projects.id_factures as id_factures')
	        		->where('factures_projects.id_factures',$id)
	        		->where('tasks.status','like','Done')
	        		->orderBy('projects.id', 'desc')
	        		->get();
	        	//	dd($done);
	        $totalFactureProjects = 0;
	        $nbrHeurProjects = 0;
			$totalFacture = 0;

			$projectId= 0;
	        foreach ($done as $key => $value) {
				DB::table('details_factures')->insert([
				    ['id_factures' => $value->id_factures, 'id_tasks' => $value->tasksId]
				]);
			
				$totalFactureProjects = $projectId!= $value->id_projects ? $value->complexity*4*$value->prix_unitaire : $totalFactureProjects + $value->complexity*4*$value->prix_unitaire;
				$nbrHeurProjects = $projectId!= $value->id_projects ? $value->complexity*4 : $nbrHeurProjects+$value->complexity*4;
				$projectId =  $projectId==0 ? $value->id_projects : ($projectId!= $value->id_projects ? $value->id_projects: $projectId);
			
		//		$projectId = $projectId == 0 ? $value->id_projects : $projectId;
		//		$nbrHeurProjects = $nbrHeurProjects + $value->complexity*4;
		//		$totalFactureProjects = $totalFactureProjects+$value->complexity*4*$value->prix_unitaire;
				$totalFacture = $totalFacture+$value->complexity*4*$value->prix_unitaire;				

				DB::table('factures_projects')
					->where('id_projects',$value->id_projects)
					->where('id_factures',$value->id_factures)
					->update(['nombre_heurs' => $nbrHeurProjects,'prix_unitaire' => $value->prix_unitaire,'total' => $totalFactureProjects])
					;
					
	        }
    		DB::table('factures')
				->where('factures.id',$value->id_factures)
				->update(['total_hors_taxe' => $totalFacture,'total' => $totalFacture]);
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

	    public function imprimerFacture($id){
	    	$data['title_page'] = "Facture".$id;
	    	$factures = DB::table('factures')
	    						->where('id',$id)->first();
	    	$clients= DB::table('clients')
	    						->join('projects','clients.id','projects.id_clients')
	    						->join('factures_projects','factures_projects.id_projects','projects.id')
	    						->where('factures_projects.id_factures',$id)->first();
	    	$factures_projects = DB::table('factures_projects')
	    						->join('projects','projects.id','factures_projects.id_projects')
	    						->where('factures_projects.id_factures',$id)->get();
	    	$factures_tasks = DB::table('details_factures')
	    						->join('tasks','tasks.id','details_factures.id_tasks')
	    						->where('details_factures.id_factures',$id)->get();
	    	$software = DB::table("entreprises")->first();
	    	$data['factures'] = $factures;
	    	$data['clients'] = $clients;
	    	$data['factures_projects'] = $factures_projects;
	    	$data['factures_tasks'] = $factures_tasks;
	    	$data['software'] = $software;
	    		    	
		    $pdf = \App::make('dompdf.wrapper');
	    	$pdf->loadHTML($this->printFacture($factures,$clients,$factures_projects,$factures_tasks,$software));
	    	return $pdf->stream();

	    	//return $this->cbView('factures_impression',$data);
	    }

	    public function printFacture($factures,$clients,$factures_projects,$factures_tasks,$software){
	    	$header="";
	    	//$body = "<img src='../../../storage/app/myImages/Logo.jpg'>";
	    	$body="<table  style='border-bottom: 2px solid #997339;' ><tr ><td style='padding-right:180px;color:#857252 ; background-color:#faf7f2;font-weight: bold; border-right: 2px solid #997339;'>";
	    	$body.="<div style=' margin-top:10px;text-align:justify;'>".$software->social_reason."<br>App 6 2eme étage M'HITA espace <br>AL moustapha Semlalia<br>".$software->zip_code." Marrakech<br>Maroc<br></div>";
    		$body.="<div style='float:right;'>";
    		$body.="</td><td >";
    		$body.="<h2 style ='color:#c19859;font-weight:bold;text-align:center'>Facture</h2>";
    		$body.="</td></tr><tr><td style='border-top: 2px solid #997339;background-color:#faf7f2;border-right: 2px solid #997339;'></td><td style ='color:#664d26;text-align:right ;border-top: 2px solid #997339;'>";
        $body.="Date :$factures->date_facture<br>";
        $body.="Reference Client:$factures->ref_clients<br>";
        $body.="N° facture:".$factures->num_facture."<br>";
        $body.=$clients->social_reason."<br>";
        $body.=$clients->adress."<br>";
    	$body.="</div>";
    	$body.="</td></tr></table>";
    	$body.="<br style='clear: both;'>";
        $body.="<div style='padding-top: 90px; padding-bottom:200px'>";
        $body.="<table width='100%' style='border: 2px solid black;'>";
        $body.="<thead><tr style='border-right: none;'>
                <th style='padding: 10px ; border-bottom: 2px solid black;'>Réference</th>
                <th style='padding: 10px ; border-bottom: 2px solid black;border-left: 2px solid black; '>Description</th>
                <th style='padding: 10px ; border-bottom: 2px solid black; border-left: 2px solid black; '>Prix unitaire</th>
                <th style='padding: 10px ; border-bottom: 2px solid black; border-left: 2px solid black; '>Qté</th>
                <th style='padding: 10px ; border-bottom: 2px solid black; border-left: 2px solid black; '>Montant</th>
            </tr>
            </thead>
            <tbody>";

	    foreach($factures_projects->take(5) as $fp){
	    	
            $body.="<tr>
                <td style='padding: 10px; border-bottom: 2px solid black;'>$fp->nom</td>
                <td style='padding: 10px ;border-bottom: 2px solid black;border-left: 2px solid black;'>$fp->version</td>
                <td style='padding: 10px; text-align: center; border-bottom: 2px solid black;border-left: 2px solid black;'>$fp->prix_unitaire</td>
                <td style='padding: 10px; text-align: right;border-bottom: 2px solid black;border-left: 2px solid black;'>$fp->nombre_heurs</td>
                <td style='padding: 10px;text-align: right;border-bottom: 2px solid black;border-left: 2px solid black;'>$fp->total</td>
            </tr>";
        }
            $body.="</tbody>
            <tfoot>
            <tr >
                <th colspan='4' style='text-align: right !important;padding: 10px;border-bottom: 2px solid black;'>Total Hors Taxes</th>
                <th style='padding: 10px ;border-bottom: 2px solid black; border-left: 2px solid black;'>$factures->total_hors_taxe $</th>
            </tr>
            <tr>
                <th colspan='4' style='text-align: right !important;padding: 10px; '>Montant Total</th>
                <th style='padding: 10px;border-left: 2px solid black;'>$factures->total $</th>
            </tr>
            </tfoot>
        </table>
    </div>
";

	    	$footer="<div style='position: fixed; bottom: 30px;'><hr style='width: 90%;background: brown;height: 3px;'>
    <div><center>
        Software SARL • App 6 2eme étage M'HITA espace AL moustapha Semlalia,40000 Marrakech Maroc<br>
N° RC 58467 • N° de Patente 92110189 • N° Id.fisc 06528370
    </center></div></div>

    </div>";

    $body2="<div style='padding-top: 40px;''>";
    $body2.="<h2 style='text-align:center;'>Details Factures</h2>

        <table width='100%'  style='border: 1px;border: 2px solid black;margin-bottom: 100px;'>
            <thead>
            <tr>
                <th style='padding: 10px;border-bottom: 2px solid black;border-top: 2px solid black;'>Réf client</th>
                <th style='padding: 10px;border-top: 2px solid black;border-left: 2px solid black;border-bottom: 2px solid black;'>Réf interne</th>
                <th style='padding: 10px;border-top: 2px solid black;border-left: 2px solid black;border-bottom: 2px solid black;'>Complexity</th>
                <th style='padding: 10px;border-top: 2px solid black;border-left: 2px solid black;border-bottom: 2px solid black;'>Nombre d'heures</th>
            </tr>
            </thead>

            <tbody>";
                    $sumHours = 0;
                foreach($factures_tasks as $ft ){
			    $sumHours = $sumHours+$ft->complexity*4;

            $body2.="<tr>
                <td style='padding: 10px ;border-bottom: 2px solid black;'>".$ft->Ref_client."</td>
                <td style='padding: 10px; text-align: center; ;border-bottom: 2px solid black;border-left: 2px solid black;'>".$ft->Ref_interne."</td>
                <td style='padding: 10px; text-align: right;border-bottom: 2px solid black;border-left: 2px solid black;'>".$ft->complexity."</td>
                <td style='padding: 10px;text-align: right;border-bottom: 2px solid black;border-left: 2px solid black;'>".($ft->complexity*4)."</td>
            </tr>";
            }
            //{{ $factures_tasks->links() }}
            $body2.="</tbody>
            <tfoot>
            <tr>
                <th colspan='3' style='text-align: right !important;padding: 10px;border-bottom: 2px solid black;'>Sum of Worked hours</th>
                <th style='padding: 10px;border-bottom: 2px solid black;border-left: 2px solid black;'>".$sumHours." h</th>
            </tr>
            <tr>
                <th colspan='3' style='text-align: right !important;padding: 10px'>Montant total</th>
                <th style='padding: 10px;border-left: 2px solid black;'>".$factures->total." $</th>
            </tr>
            </tfoot>
        </table>
    </div>";


	    	return $header.$body.$footer."<br/><br/><br/><br/>".$header.$body2;
	    }
	    public function getProjectsByFactures($factures){
	    //	return $factures;
	    	$result  = DB::table('projects')
	    				->join('factures_projects','factures_projects.id_projects','projects.id')
	    				->where('factures_projects.id_factures',$factures)
	    				->get();
	    	$name="";

	    	foreach ($result as $key => $value) {
	    	
	    		$name .= $value->nom." [ ".$value->version." ] ";
	    	}
	    	return $name;
	    }

	    public function createFacture(Request $request){
         	$id = $request->input('id');
         	$data['title_page'] = "Facture".$id;
	    	$data['factures'] = DB::table('factures')
	    						->where('id',$id)->first();
	    	$data['clients'] = DB::table('clients')
	    						->join('projects','clients.id','projects.id_clients')
	    						->join('factures_projects','factures_projects.id_projects','projects.id')
	    						->where('factures_projects.id_factures',$id)->first();
	    	$data['factures_projects'] = DB::table('factures_projects')
	    						->join('projects','projects.id','factures_projects.id_projects')
	    						->where('factures_projects.id_factures',$id)->get();
	    	$data['factures_tasks'] = DB::table('details_factures')
	    						->join('tasks','tasks.id','details_factures.id_tasks')
	    						->where('details_factures.id_factures',$id)->get();
	    	$data['software'] = DB::table("entreprises")->first();
	    						
	    	return $this->cbView('factures_impression',$data);
	    }
	}