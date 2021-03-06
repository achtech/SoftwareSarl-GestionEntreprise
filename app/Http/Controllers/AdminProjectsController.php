<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminProjectsController extends \crocodicstudio\crudbooster\controllers\CBController {
			private     $privilegeId ;
	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->privilegeId = DB::table('cms_users')->where('id',CRUDBooster::myId())->first()->id_cms_privileges;
			$this->button_add = $this->privilegeId==1;
			$this->button_edit = $this->privilegeId==1;
			$this->button_delete = $this->privilegeId==1;
			$this->button_detail = false;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "projects";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Nom","name"=>"nom"];
			$this->col[] = ["label"=>"Start Date","name"=>"start_date"];
			$this->col[] = ["label"=>"End Date","name"=>"end_date"];
			$this->col[] = ["label"=>"Technologies","name"=>"technologies"];
			$this->col[] = ["label"=>"Version","name"=>"version"];
			//$this->col[] = ["label"=>"Status","name"=>"status"];
			$this->col[] = ["label"=>"Clients","name"=>"id_clients","join"=>"clients,social_reason"];
			$this->col[] = ["label"=>"Complexity","name"=>"id","callback_php"=>'$this->getTotalComplexityByProjects($row->id)'];
			$this->col[] = ["label"=>"Progress","name"=>"id","callback_php"=>'$this->getProjectProgress($row->id)'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Nom','name'=>'nom','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Start Date','name'=>'start_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'End Date','name'=>'end_date','type'=>'date','validation'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Technologies','name'=>'technologies','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Version','name'=>'version','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Clients','name'=>'id_clients','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'clients,social_reason'];
			$this->form[] = ['label'=>'Prix Unitaire','name'=>'prix_unitaire','type'=>'number','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Honoraire','name'=>'honoraire','type'=>'select2','validation'=>'required','width'=>'col-sm-9','dataenum'=>'day;hour;total'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Nom','name'=>'nom','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Start Date','name'=>'start_date','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'End Date','name'=>'end_date','type'=>'date','validation'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Technologies','name'=>'technologies','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Version','name'=>'version','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Clients','name'=>'id_clients','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'clients,social_reason'];
			//$this->form[] = ['label'=>'Prix Unitaire','name'=>'prix_unitaire','type'=>'number','width'=>'col-sm-9'];
			//$this->form[] = ['label'=>'Honoraire','name'=>'honoraire','type'=>'select2','validation'=>'required','width'=>'col-sm-9','dataenum'=>'day;heure;total'];
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
	        $this->sub_module[] = ['label'=>'Modules','path'=>'modules','parent_columns'=>'nom','button_color'=>'primary','button_icon'=>'fa fa-bars','foreign_key'=>'id_projects','button_action_style' => "button_icon"];


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
	        $this->index_button[] = ["label"=>"Primes","icon"=>"fa fa-pie-chart","url"=>CRUDBooster::mainpath('../PrimesProjects')];



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
	        $this->script_js = $this->privilegeId!=1?"$('#btn_add_new_data').hide();":NULL;


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

	    public function getTotalComplexityTaskDoneByProjects($id){
	    	return DB::table('tasks')
	    							->join('modules', 'tasks.id_modules', '=', 'modules.id')
            						->join('projects', 'modules.id_projects', '=', 'projects.id')
            						->where('projects.id','=',$id)
                    				->where('tasks.status','=','DONE')
                    				->sum('tasks.complexity');
	    }
	    public function getTotalComplexityByProjects($id){

	    	return DB::table('tasks')
	    							->join('modules', 'tasks.id_modules', '=', 'modules.id')
            						->join('projects', 'modules.id_projects', '=', 'projects.id')
            						->where('projects.id','=',$id)
                    				->sum('tasks.complexity');
	    }

	    public function getProjectProgress($id){
	    $sumComplexityOfDone = $this->getTotalComplexityTaskDoneByProjects($id);
	    $sumComplexity =  $this->getTotalComplexityByProjects($id);
	    $result= (100*$sumComplexityOfDone/$sumComplexity);
	    return $result>0 ? $result."%" : "0%";
	    }


	    public function getListOfPrimes(){
			
		    $personnels = DB::table('users')->get();
		    $projects = DB::table('projects')->where('prime',1)->get();
   	    	$data['page_title']="Report Projects";
	    	//get list of personnel from database
	    	$result = DB::table('cms_users')
			->where('status','=','Active')->get();
			$data['personnels'] = $personnels;
			//dd($result);
	    	$data['projects'] = $projects;
	    	$complexityS = [];
	    	$pinalities = [];
	    	$primes = [];
	    	$compUser = [];
	    	$pinaUser = [];
	    	$primUser = [];
	    	for ($i=0; $i < count($personnels); $i++) { 
	    		$sum = 0;
	    		for($j=0,$k=0;$j<=count($projects);$j++) {
	    			 if(($j%3===0 && $j!==0)) {
	    			 	$compUser[$i][$k] = $complexityS[$i][$j-1]+$complexityS[$i][$j-2]+$complexityS[$i][$j-3];
	    			 	$pinaUser[$i][$k] = $pinalities[$i][$j-1]+$pinalities[$i][$j-2]+$pinalities[$i][$j-3];
	    			 	$primUser[$i][$k] = $primes[$i][$j-1]+$primes[$i][$j-2]+$primes[$i][$j-3]-$pinaUser[$i][$k];
	    			 	$k++;
	    			 	$sum=0;
	    			 }
	    			 $comp = $j!==count($projects) ? $this->getSumComplexity($personnels[$i]->id,$projects[$j]->id):0;
	    			 $pin =  $j!==count($projects) ? $this->getSumPinalities($personnels[$i]->id,$projects[$j]->id):0;
	    			 $prime = $comp * 80; //$comp * (8/2) * 200 * 0.05
	    			 if( $j!==count($projects)){
	    			 $complexityS[$i][$j] = $comp;
	    			 $pinalities[$i][$j] = $pin;
	    			 $primes[$i][$j] = $prime;
	    			 }
	    		}
	    	}    	

	    	$data['pinalities'] = $pinalities;
	    	$data['complexityS'] = $complexityS;
			$data['primes'] = $primes;
	    	$data['compUser'] = $compUser;
	    	$data['pinaUser'] = $pinaUser;
			$data['primUser'] = $primUser;
			//dd(count($personnels));
	    //dd($data['complexityS']);
	    	$this->cbView('PrimesProjects',$data);
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