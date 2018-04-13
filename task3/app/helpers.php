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
 * Slugify the text
 * @param type $text
 * @return string
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function slugify($text) {
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
    $text = preg_replace('~[^-\w]+~', '', $text);
    $text = trim($text, '-');
    $text = preg_replace('~-+~', '-', $text);
    $text = strtolower($text);
    if (empty($text)) {
        return 'n-a';
    }
    return $text;
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

$i = 0;
function get_menus($data,$setting) {
    echo "<ul>";
    foreach($data as $val){
        echo '<li style="padding:10px 0 10px;list-style:none;">';
        
        $selected = '';
        if(!empty($setting)){
            foreach($setting as $dval){
                if($dval->module_id == $val->id){
                    $selected = 'checked="checked"';
                }
            }
        }
        if($val->parent_module_id == 0){
            echo "<input ".$selected." type='checkbox' name='module[]' class='parent checkboxs' value='".$val->id."'>&nbsp;&nbsp;";
        }
        else{
            echo "<input ".$selected." type='checkbox' name='module[]' class='child checkboxs' value='".$val->id."'>&nbsp;&nbsp;";
        }
            
        //echo "<i class='".$val->icon."'></i> - ";
        echo $val->module_name;
        
        if(isset($val->children)){
            get_menus($val->children,$setting);
        }
        echo "</li>";
    }
    echo "</ul>";
}


function setAlphabet(){
    $arr = [];
    $j=0;
    for($i='A';$i<='Z';$i++){
        $arr[$j] = $i;
        $j++;
    }
    return $arr;
}

/**
 * It will get Alphabet
 * @param type $i
 * @return string
 */
function getAlphabet($i){
    $alpharr = setAlphabet();
    if(isset($alpharr[$i])){
        return $alpharr[$i];
    }
    return 'A';
}

/**
 * it will convert obj to unique array
 * @param type $obj
 * @param type $uniques
 * @return type
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function convertObjToArray($obj,$uniques=true){
    $new_arr = [];
    foreach($obj as $val){
        array_push($new_arr,$val);
    }
    if($uniques){
        $new_arr = array_unique($new_arr);
    }
    return $new_arr;
}