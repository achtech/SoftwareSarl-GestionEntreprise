<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use DateTime;

	class AdminPointages1Controller extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = false;
			$this->button_bulk_action = false;
			$this->button_action_style = "button_icon";
			$this->button_add = false;
			$this->button_edit = false;
			$this->button_delete = false;
			$this->button_detail = false;
			$this->button_show = false;
			$this->button_filter = false;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "cms_users";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Users","name"=>"name"];
			$this->col[] = ["label"=>"Conge","name"=>"id","callback_php"=>'$this->getSumConge($row->id,false)'];
			$this->col[] = ["label"=>"Free Days","name"=>"id","callback_php"=>'$this->getSumFreeDays(false)'];
			$this->col[] = ["label"=>"Required","name"=>"id","callback_php"=>'$this->getSumOfRequiredDays(false)'];
			$this->col[] = ["label"=>"Worked","name"=>"id","callback_php"=>'$this->getSumWorkedHours($row->id,false)'];
			$this->col[] = ["label"=>$this->getCurrentMonth(),"name"=>"id", "callback_php"=>'$this->getReportMensuelle($row->id)'];

			$this->col[] = ["label"=>'Global Conge',"name"=>"id", "callback_php"=>'$this->getSumConge($row->id,true)'];
			$this->col[] = ["label"=>'Global Free Days',"name"=>"id", "callback_php"=>'$this->getSumFreeDays(true)'];
			$this->col[] = ["label"=>'Global Worked',"name"=>"id", "callback_php"=>'$this->getSumWorkedHours($row->id,true)'];
			$this->col[] = ["label"=>'Global Required',"name"=>"id", "callback_php"=>'$this->getSumOfRequiredDays(true)'];
			$this->col[] = ["label"=>'Global Report',"name"=>"id", "callback_php"=>'$this->getReport($row->id)'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Users','name'=>'id_users','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'users,id'];
			//$this->form[] = ['label'=>'Date Pointage','name'=>'date_pointage','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Time In','name'=>'time_in','type'=>'time','validation'=>'required|date_format:H:i:s','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Time Out','name'=>'time_out','type'=>'time','validation'=>'required|date_format:H:i:s','width'=>'col-sm-10'];
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
//$this->table_row_color[] = ["condition"=>"strpos($this->getReportMensuelle([id]),'-')!=0","color"=>"success"];
//$this->table_row_color[] = ["condition"=>"strpos($this->getReportMensuelle([id]),'-')==0","color"=>"warning"];

	        
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

	    public function getReport($idUser){
		   	$worked = $this->getSumWorkedHours($idUser,true);
		   	$wsecond = explode(":", $worked)[2];
		   	$wminutes = explode(":", $worked)[1];
		   	$whours = explode(":", $worked)[0];

		   	 $conges = 8*$this->getSumConge($idUser,true);
		   	 $freedays = 8*$this->getSumFreeDays(true);

 		   	$sommeWorked = ($conges+$freedays+$whours).' hours ';
 		   	$sommeWorked .= (empty($wminutes)?"0 minutes":$wminutes." minutes ");
 		   	$sommeWorked .= (empty($wsecond)?"0 seconds":$wsecond." seconds");
 		
 		   	$fullTime = $this->requiredDays(true);
			 $required  = explode(":", $fullTime)[0]." hours ".explode(":", $fullTime)[1]." minutes 0 seconds";
			$start = strtotime($sommeWorked);
			 $end = strtotime($required);
			if($end>$start) return "-".date("H:i:s",$end - $start);
			else return date("H:i:s",$start - $end);
	    }

	    public function getReportMensuelle($idUser){
		   	$worked = $this->getSumWorkedHours($idUser,false);
		   	$wsecond = explode(":", $worked)[2];
		   	$wminutes = explode(":", $worked)[1];
		   	$whours = explode(":", $worked)[0];

		   	$conges = 8*$this->getSumConge($idUser,false);
		   	$freedays = 8*$this->getSumFreeDays(false);

 		   
 		   	$sommeWorked = ($conges+$freedays+$whours).' hours ';
 		   	$sommeWorked .= (empty($wminutes)?"0 minutes":$wminutes." minutes ");
 		   	$sommeWorked .= (empty($wsecond)?"0 seconds":$wsecond." seconds");

 		 
 		   	$fullTime = $this->requiredDays(false);
			$required  = explode(":", $fullTime)[0]." hours ".explode(":", $fullTime)[1]." minutes 0 seconds";

			$start = strtotime($sommeWorked);
			$end = strtotime($required);
			if($end>$start) return "-".date("H:i:s",$end - $start);
			else return date("H:i:s",$start - $end);
	    }

	    public function getSumWorkedHours($id,$all){
			$datedebut = $all?date('Y-m-d',strtotime("2018-11-01")):date('Y-m-d',strtotime(date('Y-m')."-01"));		   	
			$datefin = date('Y-m-d');
	    	$result = DB::table('pointages')
	    		->select(DB::raw("SUM(TIMESTAMPDIFF(SECOND,pointages.time_in,pointages.time_out)) as count"))
	    		->where('pointages.id_users','=',$id)
         		->whereBetween('pointages.date_pointage',[$datedebut,$datefin])
                ->first()->count;
			$result1 = DB::select("select SUM(TIMESTAMPDIFF(SECOND,pointages.time_in,cast('".date('H:i')."' as time))) as count from pointages where pointages.id_users=".$id." and pointages.date_pointage='".$datefin."' and pointages.time_in=pointages.time_out");
			$result1 = empty($result1) || count($result1)==0?0:$result1[0]->count;
//                
            $result = empty($result)?0: $result;
            $result1 = empty($result1)?0: $result1;
            return $this->secondsToHours($result+$result1);
	    }

	    public function secondsToHours($seconds){
		    $h = intval($seconds / 3600);
		    $sec = $seconds - $h*3600;
		    $m = intval($sec / 60);
		    $s =  $sec - $m * 60;
		    return $h.":".($m<10?"0".$m:$m).":".($s<10?"0".$s:$s);
		}

	    public function getCurrentMonth(){
	    	return date('m-Y');
	    }

	    public function getSumConge($idUser,$all){
			$datedebut = $all?date('Y-m-d',strtotime("2018-11-01")):date('Y-m-d',strtotime(date('Y-m')."-01"));		   	$datefin = date('Y-m-d');
			$case2= DB::table('conges')
			    ->select(DB::raw("SUM(conges.nbr_days) as count"))
	    		->where('conges.id_users','=',$idUser)
	    	//	->where('conges.isJustify','=','Non')
	    		->whereBetween('conges.start_date',[$datedebut,$datefin])
	    		->whereBetween('conges.end_date',[$datedebut,$datefin])
        		->first()->count;
	        return empty($case2)?0:$case2;

	    }

	    public function getSumFreeDays($all){

     		$datedebut = $all?date('Y-m-d',strtotime("2018-11-01")):date('Y-m-d',strtotime(date('Y-m')."-01"));
		   	$datefin = date('Y-m-d');

	    	$result = DB::table('freedays')
	    		->select(DB::raw("SUM(DATEDIFF(freedays.end_date,freedays.start_date)) as count"))
         		->whereBetween('freedays.start_date',[$datedebut,$datefin])
         		->whereBetween('freedays.end_date',[$datedebut,$datefin])
                ->first()->count;
            return empty($result)?0:$result;
	    }

	    public function requiredDays($all){
     		$datedebut = $all?date('Y-m-d',strtotime("2018-11-01")):date('Y-m-d',strtotime(date('Y-m')."-01"));
		   	$datefin = date('Y-m-d');
		   	$nbrDays = $this->nombreJour($datedebut,$datefin);
		   	//TODO cette result inclus aujourd'hui alors on doit calculer le nombre d'heur juska cette moment
		   	//if datefin not a weekend
		   	$weekDay = date('w', strtotime($datefin));
		   	$nbrHours = 0;
    		if($weekDay == 0 || $weekDay == 6){
		   		$nbrHours = ($nbrDays*8).":00";
		   	}else{
		   		$time = date('H:i', strtotime(date('H:i')) + 60*60);
				//TODO PROBLEM IN GET REQUIRED HOURS OF TODAY
				$current_time =date('H:i', strtotime(date('H:i')) + 60*60);
				$start = "9:30";
				$end = "17:30";
				$date1 = DateTime::createFromFormat('H:i', $current_time);
				$date2 = DateTime::createFromFormat('H:i', $start);
				$date3 = DateTime::createFromFormat('H:i', $end);
				if ($date1 > $date2 && $date1 < $date3)
				{
					$nbrDays = $nbrDays-1;
			   		$requiredHoursOfToday = $this->getTimeDiff($current_time,$start);				   
				} else if ($date1<$date2){
					$nbrDays = $nbrDays-1;
					$requiredHoursOfToday = 0;
				}
  			    $nbrHours = (($nbrDays*8)+ explode(":", $requiredHoursOfToday)[0]).":";
  			    $nbrHours .= (!empty(explode(":", $requiredHoursOfToday)[1]))?explode(":", $requiredHoursOfToday)[1]:"00:00";
		   	}

		   	return $nbrHours;
		   	//return $nbrDays."days (".($nbrHours)." Hours)";
	    }

	    public function getTimeDiff($dtime,$atime)
    	{
	        $nextDay = $dtime>$atime?1:0;
	        $dep = explode(':',$dtime);
	        $arr = explode(':',$atime);
	        $diff = abs(mktime($dep[0],$dep[1],0,date('n'),date('j'),date('y'))-mktime($arr[0],$arr[1],0,date('n'),date('j')+$nextDay,date('y')));
	        $hours = floor($diff/(60*60));
	        $mins = floor(($diff-($hours*60*60))/(60));
	        $secs = floor(($diff-(($hours*60*60)+($mins*60))));
	        if(strlen($hours)<2){$hours="0".$hours;}
	        if(strlen($mins)<2){$mins="0".$mins;}
	        if(strlen($secs)<2){$secs="0".$secs;}
	        return $hours.':'.$mins.':'.$secs;
    	}

	    public function getSumOfRequiredDays($all){
	    	return $src=$this->requiredDays($all);
	    	$heur = explode(":", $src)[0];
	    	$min = explode(":", $src)[1];
	    	$nbDays = intval($heur/8);
	    	$nbHours = $heur - $nbDays*8;
	    	return $nbDays."(".$src.")";
	    }

	    public function nombreJour($datedeb,$datefin){
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