<?php
namespace App\Modules\Admin\Models;
use App\Models\InternetOne;

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

}
