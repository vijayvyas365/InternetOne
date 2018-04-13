<?php

namespace App\Modules\User\Models;

use App\Models\InternetOne;
use Auth;
use DB;
use Yajra\DataTables\DataTables;

class User extends InternetOne {

    protected $table = 'users';
    protected $fillable = [
        'fname',
        'lname',
        'email',
        'country',
        'mobile_no',
        'about_you',
        'dob',
        'status',
        'created_by',
        'modified_by',
        'created_at',
        'modified_at',
    ];

    /**
     * Relation between Country & User
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function countries() {
        return $this->belongsTo('App\Modules\Country\Models\Country',"country");
    }
    
    /**
     * Relation between Country & User
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function admin() {
        return $this->belongsTo('App\Modules\Admin\Models\Admin',"created_by");
    }

    /**
     * 
     * @param type $options
     * @return type
     */
    protected function _getQuery($options = []) {
        $query = parent::query();
        return $query;
    }

    /**
     * 
     * @return string
     */
    public function getFetchCols() {
        $cols = [
            $this->getTable() . ".*",
        ];
        return $cols;
    }

    /**
     * 
     * @return type
     */
    public function fetchAllDatatable() {
        $q = parent::query();
        return Datatables::of($q)
                        ->addColumn('status', function ( $q ) {
                            if ($q->status == 1) {
                                return '<lable class="label bg-success-400">Active</lable>';
                            } else {
                                return '<lable class="label bg-danger-400">Deactive</lable>';
                            }
                        })
                        ->addColumn('created_at', function ( $q ) {
                            return date("d/m/Y", strtotime($q->created_at));
                        })
                        ->addColumn('country', function ( $q ) {
                            return $q->countries->country_name;
                        })
                        ->addColumn('fname', function ( $q ) {
                            return $q->fname . " " . $q->lname;
                        })
                        ->addColumn('actions', function ( $q ) {
                            $action = '<ul class="icons-list text-center">';
                            $action .= '<li class="text-info-600"><a href="' . route('user.show', $q->id) . '" title="View"><i class="icon-eye"></i></a></li>';
                            $action .= '<li class="text-primary-600"><a href="' . route('user.edit', $q->id) . '" title="Edit"><i class="icon-pencil7"></i></a></li>';
                            $action .= view('layouts.delete')->with('model', $q)->with('route', 'user.destroy');
                            $action .= '</ul>';
                            return $action;
                        })
                        ->rawColumns(['status', 'actions','is_super_user'])
                        ->make(true);
    }

}
