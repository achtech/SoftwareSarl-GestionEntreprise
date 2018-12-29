<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminPersonnelsController extends \crocodicstudio\crudbooster\controllers\CBController {
		private     $privilegeId ;
	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "last_name";
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
			$this->table = "personnels";
			$this->privilegeId = DB::table('cms_users')->where('id',CRUDBooster::myId())->first()->id_cms_privileges;
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Photo","name"=>"id_users","join"=>"cms_users,photo","image"=>true];
			$this->col[] = ["label"=>"Polite","name"=>"polite"];
			$this->col[] = ["label"=>"Nom","name"=>"id_users","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Cin","name"=>"cin"];
			$this->col[] = ["label"=>"Cnss","name"=>"cnss"];
			$this->col[] = ["label"=>"Mobile","name"=>"mobile"];
			$this->col[] = ["label"=>"Date d'embauche","name"=>"hiring_date"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Nom','name'=>'id_users','type'=>'select2','validation'=>'required','width'=>'col-sm-9','datatable'=>'cms_users,name'];
			$this->form[] = ['label'=>'Cin','name'=>'cin','type'=>'text','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Cnss','name'=>'cnss','type'=>'text','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Polite','name'=>'polite','type'=>'text','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Mobile','name'=>'mobile','type'=>'text','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Adress','name'=>'adress','type'=>'textarea','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Hiring Date','name'=>'hiring_date','type'=>'date','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Exit Date','name'=>'exit_date','type'=>'date','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Birth Date','name'=>'birth_date','type'=>'date','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Order Number','name'=>'order_number','type'=>'number','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Professions','name'=>'id_professions','type'=>'select2','validation'=>'required','width'=>'col-sm-10','datatable'=>'professions,libelle'];
			$this->form[] = ['label'=>'Net Salary','name'=>'net_salary','type'=>'text','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Gross Salary','name'=>'gross_salary','type'=>'text','validation'=>'required','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Family Situation','name'=>'family_situation','type'=>'text','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Number Children','name'=>'number_children','type'=>'number','validation'=>'required','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Nom','name'=>'id_users','type'=>'select2','validation'=>'required','width'=>'col-sm-9','datatable'=>'cms_users,name'];
			//$this->form[] = ['label'=>'Cin','name'=>'cin','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Cnss','name'=>'cnss','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Polite','name'=>'polite','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Mobile','name'=>'mobile','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Adress','name'=>'adress','type'=>'textarea','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Hiring Date','name'=>'hiring_date','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Exit Date','name'=>'exit_date','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Birth Date','name'=>'birth_date','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Order Number','name'=>'order_number','type'=>'number','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Professions','name'=>'id_professions','type'=>'select2','width'=>'col-sm-10','datatable'=>'professions,libelle'];
			//$this->form[] = ['label'=>'Net Salary','name'=>'net_salary','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Gross Salary','name'=>'gross_salary','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Family Situation','name'=>'family_situation','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Number Children','name'=>'number_children','type'=>'number','width'=>'col-sm-10'];
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
	        if($this->privilegeId!=1){
	        		$query->where('personnels.id_users',$this->privilegeId);
	        }   
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