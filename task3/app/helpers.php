<?php

/**
 * All common function goes here.
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */

/**
 * it will print array in format
 * @param type $arr
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function printarr($arr) {
    echo "<pre>";
    print_r($arr);
    echo "<pre>";
}

/**
 * It will print the SQL with all parameter
 * @param type $builder
 * @return type
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function getSQL($builder) {
    $sql = $builder->toSql();
    foreach ($builder->getBindings() as $binding) {
        $value = is_numeric($binding) ? $binding : "'" . $binding . "'";
        $sql = preg_replace('/\?/', $value, $sql, 1);
    }
    return $sql;
}

/**
 * it will convert obj to unique array
 * @param type $obj
 * @param type $uniques
 * @return type
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function convertObjToArray($obj, $uniques = true) {
    $new_arr = [];
    foreach ($obj as $val) {
        array_push($new_arr, $val);
    }
    if ($uniques) {
        $new_arr = array_unique($new_arr);
    }
    return $new_arr;
}
