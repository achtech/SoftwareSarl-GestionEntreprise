<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminCongesController extends \crocodicstudio\crudbooster\controllers\CBController {
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
			$this->button_add = true;
			$this->privilegeId = DB::table('cms_users')->where('id',CRUDBooster::myId())->first()->id_cms_privileges;
			$this->button_edit = $this->privilegeId==1;
			$this->button_delete = $this->privilegeId==1;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "conges";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Employe","name"=>"id_users","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Start Date","name"=>"start_date"];
			$this->col[] = ["label"=>"End Date","name"=>"end_date"];
			$this->col[] = ["label"=>"Libelle","name"=>"libelle"];
			$this->col[] = ["label"=>"Nbr Days","name"=>"nbr_days"];
			$this->col[] = ["label"=>"Is valid","name"=>"isValid"];
			$this->col[] = ["label"=>"Is justify","name"=>"isJustify"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			if(!CRUDBooster::isSuperadmin()){
				$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','width'=>'col-sm-10','datatable'=>'cms_users,name',"datatable_where"=>"id = ".CRUDBooster::myId()];
			}else{
				$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','width'=>'col-sm-10','datatable'=>'cms_users,name'];
			}
			$this->form[] = ['label'=>'Libelle','name'=>'libelle','type'=>'text','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Date Request','name'=>'date_request','type'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Start Date','name'=>'start_date','type'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'End Date','name'=>'end_date','type'=>'date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Nbr Days','name'=>'nbr_days','type'=>'number','width'=>'col-sm-10'];
			if($this->privilegeId===1){
			$this->form[] = ['label'=>'Valid','name'=>'isValid','type'=>'radio','width'=>'col-sm-10','dataenum'=>'Oui;Non'];
			$this->form[] = ['label'=>'Justified','name'=>'isJustify','type'=>'radio','width'=>'col-sm-10','dataenum'=>'Oui;Non'];
			}
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','width'=>'col-sm-10','datatable'=>'cms_users,name'];
			//$this->form[] = ['label'=>'Libelle','name'=>'libelle','type'=>'text','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Date Request','name'=>'date_request','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Start Date','name'=>'start_date','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'End Date','name'=>'end_date','type'=>'date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Nbr Days','name'=>'nbr_days','type'=>'number','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Is Valid','name'=>'isValid','type'=>'radio','width'=>'col-sm-10','dataenum'=>'Oui;Non'];
			//$this->form[] = ['label'=>'Is Justify','name'=>'isJustify','type'=>'radio','width'=>'col-sm-10','dataenum'=>'Oui;Non'];
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
			$this->index_button[] = ["label"=>"Report congé","icon"=>"fa fa-pie-chart","url"=>CRUDBooster::mainpath('../congeReport')];
			if($this->privilegeId===1){
				$this->index_button[] = ["label"=>"Status des salaries","icon"=>"fa fa-users","url"=>CRUDBooster::mainpath('../statusSalarie')];
			}

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
	    	if(!CRUDBooster::isSuperadmin()){
	        	$query->where('conges.id_users',CRUDBooster::myId());
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

		public function getStatusSalarie(){
			$data['page_title']="Status des salaries";
	    	//get list of personnel from database
	    	$result = DB::table('cms_users')
	    				->join('personnels','personnels.id_users','=','cms_users.id')
	    				->get();
	    	$data['personnels'] = $result;
	    	$this->cbView('statusSalarie',$data);	    	
		}

	    public function getListOfConge(){
	    	$data['page_title']="Report Conge";
	    	//get list of personnel from database
	    	$result = DB::table('cms_users')
	    				->get();
	    	$data['personnels'] = $result;
    	
	    	$this->cbView('congeReport',$data);
	    }

	    public static function getNombreJourCongePri($user,$month,$year)
	    {	
	    	$nb = 0;
	    	$start = empty($month)?$year."-01-01":$year."-".$month."-01";
	    	$end = empty($month)?$year."-12-31":$year."-".$month."-31";
	 		 $result = DB::table('conges')
	 				->where('id_users',$user)
	 				->where('isJustify',"Non")
	 				->whereBetween('start_date',[$start,$end])
	 				->whereBetween('end_date',[$start,$end])
	    			->sum('nbr_days');
	    	return empty($result) ? "0":intval($result);
	    }

	    public static function getNombreJourCongeCredit($user,$year){	
    		$dateContrat = parent::getValeurChamp('personnels','hiring_date','id',$user);
    		$firstMonth = explode('-',$dateContrat)[1];
    		$firstYear = explode('-',$dateContrat)[0];
    		
    		if(!empty($dateContrat)){
    			$currentYear=$firstYear;
    			if($firstYear>$year){
    				return "Not Yet";
    			}else{
	    			$nbDaysRequired = 0;
	    			$nbDaysTaked = 0;
	    			while ($currentYear<=$year) {
	    				$nbDaysTaked =$nbDaysTaked+ self::getNombreJourCongePri($user,'',$currentYear);
	    				$nbDaysRequired = $currentYear==$firstYear?(13-intval($firstMonth))*1.5:$nbDaysRequired+18;
	    				$currentYear++;
	    			}
	    				$diff=$nbDaysRequired-$nbDaysTaked;
	    				$nb=$nb+($diff>36?36:$diff);

		    		return $nb;
	    		}
	    	} else {
	    		return "Not Yet";
	    	}
	    }

	    public static function getNbrHeurs($user,$month,$year){
	    	$congePris = self::getNombreJourConge($user,$month,$year);
	    	$congePris = empty($congePris)?0:$congePris;
	    	 $nbrWorkedHours = self::nombreJour(date('Y-m-d',$year."-".$month."-01"),date('Y-m-t',$year."-".$month."-01"));

	    	return $congePris-1===$nbrWorkedHours?0:intval(191-($congePris*8));
	    }

	    public static function getMotif($user,$month,$year){
	    	$start = empty($month)?$year."-01-01":$year."-".$month."-01";
	    	$end = empty($month)?$year."-12-31":$year."-".$month."-31";
	 		 $result = DB::table('conges')
	 				->select(DB::raw('CONCAT(SUM(nbr_days), " jour(s) : ", libelle) AS lib') )
	 		 		//->select("libelle as lib")
	 				->where('id_users',$user)
	 				->whereBetween('start_date',[$start,$end])
	 				->whereBetween('end_date',[$start,$end])
	    			->groupBy('libelle')
	    			->get();

	    	$res="";
	    	foreach ($result as $key => $value) {
	    		$res.= $value->lib." .\r\n";
	    	}
	    	return substr($res,0,-1);
	    	 
	    }
	    //justifier et non justifier
	    public static function getNombreJourConge($user,$month,$year)
	    {	
	    	$nb = 0;
	    	$start = empty($month)?$year."-01-01":$year."-".$month."-01";
	    	$end = empty($month)?$year."-12-31":$year."-".$month."-31";
	 		 $result = DB::table('conges')
	 				->where('id_users',$user)
	 				->whereBetween('start_date',[$start,$end])
	 				->whereBetween('end_date',[$start,$end])
	    			->sum('nbr_days');
	    	return empty($result) ? "0":intval($result);
	    }

	     public static function nombreJour($datedeb,$datefin){
		    $nb_jours=0;
		    $dated=explode('-',$datedeb);
		    $datef=explode('-',$datefin);
		    if(count($dated)==3 && count($datef)==3){
		        $timestampcurr=mktime(0,0,0,$dated[1],$dated[2],$dated[0]);
		        $timestampf=mktime(0,0,0,$datef[1],$datef[2],$datef[0]);
		        while($timestampcurr<=$timestampf){
		     
		          if((date('w',$timestampcurr)!=0)&&(date('w',$timestampcurr)!=6)){
		            $nb_jours++;
		          }
		          $timestampcurr=mktime(0,0,0,date('m',$timestampcurr),(date('d',$timestampcurr)+1)   ,date('Y',$timestampcurr));
		        }
		        return $nb_jours;
		    }else{
		        return 0;
		    }
		}


	    public function printpdf()
	    {
	    	
		    $pdf = \App::make('dompdf.wrapper');
	    	$pdf->loadHTML($this->printStatusSalarie());
	    	return $pdf->stream();
	    }
	    public function printStatusSalarie(){
	    	$personnels = DB::table('personnels')->join('cms_users','cms_users.id','=','personnels.id_users')->get();

	    	$header = "";
	    	$body = "<table>
                                <thead><tr>
                                    <th>Nom</th>
                                    <th>Salaire net</th>
                                    <th>Nombre d'heur</th>
                                    <th>Congé</th></tr>
                                </thead>
                                
                                <tbody>";
                                    for($i=0;$i<count($personnels);$i++){
                                        $body .="<tr >
                            <td>".$personnels[$i]->name."</td> 
                            <td>".$personnels[$i]->net_salary."</td> 
                            <td>".self::getNbrHeurs($personnels[$i]->id,date('m'),date('Y'))."</td> 
                            <td>".self::getMotif($personnels[$i]->id,date('m'),date('Y'))."</td> 
                    </tr>";
                                 }       
                                $body .="</tbody>
                            </table>";
	    	$footer = "";

	    	return $header.$body.$footer;
	    }
	}