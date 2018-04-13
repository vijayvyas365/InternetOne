<?php

namespace App\Modules\Country\Models;

use App\Models\InternetOne;
use Auth;
use DB;
use Yajra\DataTables\DataTables;

class Country extends InternetOne {

    protected $table = 'countries';
    protected $fillable = [
        'id',
        'sortname',
        'country_name',
        'phone_code',
        'status',
    ];

    /**
     * Relation between User & country
     * @return type
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function user() {
        return $this->hasMany('App\Modules\User\Models\User');
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
                        ->rawColumns(['status', 'actions', 'is_super_country'])
                        ->make(true);
    }
    
    /**
     * It will fetch active country
     * @return mixex
     * @author Vijay Vyas <vijayvyas365@gmail.com>
     */
    public function fetchActiveCountry(){
        $country_obj = new Country();

        $opt = [];
        $opt["where"] = ["status" => 1];
        $result = $country_obj->find($opt);
        return $result;
    }

}
