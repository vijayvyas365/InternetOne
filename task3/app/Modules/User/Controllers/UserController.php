<?php

namespace App\Modules\User\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use App\Modules\User\Models\User;
use App\Modules\Country\Models\Country;

use Auth;
use Session;


class UserController extends Controller {

    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function index(Request $request) {
        if ($request->ajax()) {
            $acc_obj = new User();
            $data = $acc_obj->fetchAllDatatable();
            return $data;
        }
        return view("User::index");
    }

    /**
     * It will create form
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function create() {
        $data["id"] = 0;
        $country_obj = new Country();
        $data["country_list"] = $country_obj->fetchActiveCountry();
        return view("User::form")->with("data", $data);
    }

    /**
     * It will store user data
     * @param Request $request
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function store(Request $request) {
        try {
            $id = $request->input("id");
            $arr = array();
            $arr["fname"] = $request->input("txtfname");
            $arr["lname"] = $request->input("txtlname");
            $arr["email"] = $request->input("txtemail");
            $arr["country"] = $request->input("country");
            $arr["mobile_no"] = $request->input("txtmobile");
            $arr["about_you"] = $request->input("txtaboutyou");
            $arr["dob"] = $request->input("txtdob");
            $arr["status"] = !empty($request->input("status")) ? 1 : 0;

            if (empty($id)) {
                $arr["created_by"] = Auth::user()->id;
            } else {
                $arr["modified_by"] = Auth::user()->id;
            }
            User::updateOrCreate(["id" => $id], $arr);
            Session::flash('flash_message', "User has been saved successfully.");
        } 
        catch (\Illuminate\Database\QueryException $e){
            Session::flash('error_message', "Oops! Something went wrong. Please contact to useristrator.");
        }
        catch (Exception $ex) {
            Session::flash('error_message', "Oops! Something went wrong. Please contact to useristrator.");
        }
        return Redirect::route("user.index");
    }

    /**
     * fetch edit data
     * @param type $id
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function edit($id) {
        $data["id"] = $id;
        $user_obj = new User();
        $data["info"] = $user_obj->findById($id);

        //---- get country list
        $country_obj = new Country();
        $data["country_list"] = $country_obj->fetchActiveCountry();

        return view("User::form")->with("data", $data);
    }

    /**
     * Remove the specified resource from storage.
     * @param  int $id
     * @return Response
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function destroy($id) {
        try {
            $model = new User();
            $data = $model->findById($id);
            $data->delete();

            Session::flash('flash_message', "SAAS User has been deleted successfully.");
        } catch (\Illuminate\Database\QueryException $e) {
            Session::flash('error_message', "Oops! Something went wrong. Please contact to useristrator.");
        } catch (Exception $ex) {
            Session::flash('error_message', "Oops! Something went wrong. Please contact to useristrator.");
        }
        return Redirect::route("user.index");
    }

    /**
     * Detail information about the user
     * @param type $id
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function show($id) {
        $model = new User();
        $data["info"] = $model->findById($id);
        return view("User::show")->with("data", $data);
    }

    /**
     * It will check email if is exits in our database
     * @param Request $request
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function emailvalidation(Request $request, $id) {
        $email = $request->input("txtemail");
        $query = User::where("email", $email);
        if (!empty($id)) {
            $query->where("id", "<>", $id);
        }
        $isFound = $query->count();
        if ($isFound > 0) {
            echo "false";
        } else {
            echo "true";
        }
    }

    /**
     * Its change profile view
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function changeprofile(Request $request) {


        if ($request->isMethod('post')) {
            $arr = array();
            $arr["fname"] = $request->input("txtfname");
            $arr["lname"] = $request->input("txtlname");
            $arr["email"] = $request->input("txtemail");

            $arr["address"] = $request->input("txtaddress");
            $arr["city"] = $request->input("txtcity");
            $arr["state"] = $request->input("txtstate");
            $arr["country"] = $request->input("country");
            $arr["zipcode"] = $request->input("txtzipcode");
            $arr["mobile_no"] = $request->input("txtmobile");
            $arr["gender"] = $request->input("gender");


            $arr["modified_by"] = Auth::user()->id;

            User::updateOrCreate(["id" => Auth::user()->id], $arr);

            Session::flash('flash_message', "Your profile has been changed successfully.");
            return redirect("changeprofile");
        }
        return view("User::changeprofile");
    }

}
