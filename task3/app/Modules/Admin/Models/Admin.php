<?php

namespace App\Modules\Admin\Models;

use App\Models\InternetOne;
use Auth;
use DB;
use Yajra\DataTables\DataTables;

class Admin extends InternetOne {

    protected $table = 'admins';
    protected $fillable = [
        'fname',
        'lname',
        'email',
        'password',
        'status',
        'is_super_admin',
        'remember_token',
        'created_by',
        'modified_by',
        'created_at',
        'modified_at',
    ];

    /**
     * Relation between Account & Admin
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function account() {
        return $this->hasMany('App\Modules\Account\Models\Account');
    }
    
    /**
     * 
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function test() {
        return $this->hasMany('App\Modules\Test\Models\Test');
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
                        ->addColumn('is_super_admin', function ( $q ) {
                            if ($q->is_super_admin == 1) {
                                return '<lable class="label bg-success-400">Yes</lable>';
                            } else {
                                return '<lable class="label bg-danger-400">No</lable>';
                            }
                        })
                        ->addColumn('fname', function ( $q ) {
                            return $q->fname . " " . $q->lname;
                        })
                        ->addColumn('actions', function ( $q ) {
                            $action = '<ul class="icons-list text-center">';
                            //$action .= '<li class="text-primary-600"><a href="' . route('account.show', $q->id) . '" title="Edit"><i class="icon-eye"></i></a></li>';
                            $action .= '<li class="text-primary-600"><a href="' . route('admin.edit', $q->id) . '" title="Edit"><i class="icon-pencil7"></i></a></li>';
                            $action .= view('layouts.delete')->with('model', $q)->with('route', 'admin.destroy');
                            $action .= '</ul>';
                            return $action;
                        })
                        ->rawColumns(['status', 'actions','is_super_admin'])
                        ->make(true);
    }

}
