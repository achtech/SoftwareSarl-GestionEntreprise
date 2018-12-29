<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Http\Controllers\AdminPointages1Controller;
	use App\Http\Controllers\AdminCongesController;

	class HomeController extends AdminPointages1Controller {
	    public function index() {
	    	$data['page_title']="Home";
	    	$result = DB::table('cms_users')->get();
	    	$tab = [];
	    	$i=0;
	    	foreach ($result as $key => $value) {
	    		$tab[$i]['user']=$value;
	    		$tab[$i]['pointage']=parent::getReport($value->id);
	    		$tab[$i]['conge']=AdminCongesController::getNombreJourCongeCredit($value->id,date('Y'));
	    		$i=$i+1;	
	    	}
	    	$data['users']=$tab;
	    	//dd($tab);
	 		return View('home',$data);
	    }
	}
