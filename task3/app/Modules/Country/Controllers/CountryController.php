<?php

namespace App\Modules\Country\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use App\Modules\Country\Models\Country;
use DB;
use Auth;
use Session;
use View;

class CountryController extends Controller {

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function index(Request $request) {
        if ($request->ajax()) {
            $acc_obj = new Country();
            $data = $acc_obj->fetchAllDatatable();
            return $data;
        }
        return view("Country::index");
    }

}
