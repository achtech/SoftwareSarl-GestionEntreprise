<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminPrimesController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->table = "primes";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Users","name"=>"id_users","join"=>"users,nom"];
			$this->col[] = ["label"=>"Date Paiement","name"=>"date_paiement"];
			$this->col[] = ["label"=>"Projects","name"=>"id","callback_php"=>'$this->getProjectName($row->id)'];
			$this->col[] = ["label"=>"Pinalites","name"=>"pinalites"];
			$this->col[] = ["label"=>"Complexite","name"=>"complexite"];
			$this->col[] = ["label"=>"Prime","name"=>"prime"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			//$this->form = [];
			//$this->form[] = ['label'=>'Date Paiement','name'=>'date_paiement','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Projects','name'=>'id_projects','type'=>'select2','width'=>'col-sm-10','datatable'=>'projects,version','relationship_table'=>'primes_projects','datatable_format'=>'nom,\' ---> \',version'];
			# END FORM DO NOT REMOVE THIS LINE

			$this->form = [];
			$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','width'=>'col-sm-10','datatable'=>'users,nom'];
			$this->form[] = ['label'=>'Date Paiement','name'=>'date_paiement','type'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Projects','name'=>'id_projects','type'=>'select2','width'=>'col-sm-10','datatable'=>'projects,version','relationship_table'=>'primes_projects','datatable_format'=>'nom,\' ---> \',version'];
			/*$this->form[] = ['label'=>'Penalites','name'=>'pinalites','type'=>'number','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Complexite','name'=>'complexite','type'=>'number','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Prime','name'=>'prime','type'=>'number','width'=>'col-sm-10'];
			*/
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
	    //	dd($postdata);
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
			$projects = DB::table('primes_projects')
            	->where('id_primes','=',$id)
            	->get();
            $user = DB::table('primes')
            	->where('id','=',$id)
            	->first()->id_users;
            $percentagePrime =DB::table('settings')
            	->first()->prime_percentage; 
            $complexity = 0;
            $penalite = 0;
         //   dd($projects);
            for ($i=0;$i<count($projects);$i++) {
            	$complexity = $complexity + intval($this->getSumComplexity($user,$projects[$i]->id_projects));
            	$penalite = $penalite + intval($this->getSumPinalities($user,$projects[$i]->id_projects));
            }
            $primes = ($complexity * ($percentagePrime/100) * 200 * (8/2)) - $penalite;
            DB::table('primes')
					->where('id',$id)
					->update(['pinalites' => $penalite,'complexite' => $complexity,'prime' => $primes])
					;
					
	    }

	    public function getProjectName($id){
	    	$result = '';
	    	$projects = DB::table('projects')
	    		->join('primes_projects', 'primes_projects.id_projects', '=', 'projects.id')
            	->where('primes_projects.id_primes','=',$id)
            	->get();
            for ($i=0;$i<count($projects);$i++) {
            	$result = $i != 0 ? $result.", ".$projects[$i]->version : $projects[$i]->version;
            }	
            return $result;
            
	    }

	   	public function getSumComplexity($userId,$projectId){
	    	return DB::table('tasks')
		    	->join('modules', 'tasks.id_modules', '=', 'modules.id')
    			->join('projects', 'modules.id_projects', '=', 'projects.id')
            	->where('projects.id','=',$projectId)
            	->where('tasks.id_users','=',$userId)
            	->sum('tasks.complexity');
	    }	  

	    public function getSumPinalities($userId,$projectId){
	    	return DB::table('pinalites')
            	->where('id_projects','=',$projectId)
            	->where('id_users','=',$userId)
            	->sum('type');
	    }	  

   	    public static function getComplexityProjects($id){

	    	return DB::table('tasks')
	    				->join('modules', 'tasks.id_modules', '=', 'modules.id')
           				->join('projects', 'modules.id_projects', '=', 'projects.id')
   						->where('projects.id','=',$id)
  						->sum('tasks.complexity');
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
	        $projects = DB::table('primes_projects')
            	->where('id_primes','=',$id)
            	->get();
            $user = DB::table('primes')
            	->where('id','=',$id)
            	->first()->id_users;
            $percentagePrime =DB::table('settings')
            	->first()->prime_percentage; 
            $complexity = 0;
            $penalite = 0;
         //   dd($projects);
            for ($i=0;$i<count($projects);$i++) {
            	$complexity = $complexity + intval($this->getSumComplexity($user,$projects[$i]->id_projects));
            	$penalite = $penalite + intval($this->getSumPinalities($user,$projects[$i]->id_projects));
            }
            $primes = ($complexity * ($percentagePrime/100) * 200 * (8/2)) - $penalite;
            DB::table('primes')
					->where('id',$id)
					->update(['pinalites' => $penalite,'complexite' => $complexity,'prime' => $primes])
					;

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