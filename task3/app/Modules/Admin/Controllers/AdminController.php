<?php

namespace App\Modules\Admin\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use App\Modules\Admin\Models\Admin;

use DB;
use Auth;
use Session;
use View;

class AdminController extends Controller {
    
    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function index(Request $request) {
        return view("Admin::index");
    }
    

}
