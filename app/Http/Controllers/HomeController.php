<?php namespace App\Http\Controllers;

use App\Http\Controllers\Adminpointages1Controller;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class HomeController extends Controller {

	    public function index() {
	    	$data['page_title']="Home";
	    	$result = DB::table('cms_users')->get();
	    	$data['users']=$result;
	 		return View('home',$data);
	    }

	    public static function getReport($id){
	    	return $id;
	    	return new Adminpointages1Controller().getReport($id);
	    }

	}
