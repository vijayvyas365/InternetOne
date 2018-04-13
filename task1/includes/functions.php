<?php

/**
 * 
 * @param type $elements
 * @param type $parentId
 * @param type $ctr
 * @return type
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function getHierarchicalArray($elements, $parentId = 0) {
    $branch = [];
    foreach ($elements as $element) {
        if ($element->parent == $parentId) {
            $children = getHierarchicalArray($elements, $element->id);
            if ($children) {
                $element->children = $children;
            }
            array_push($branch, $element);
        }
    }
    return $branch;
}

/**
 * It will print the json in formatted tabbed
 * @param type $json
 * @return string
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function formatJson($json) {
    $result = '';
    $level = 0;
    $in_quotes = false;
    $in_escape = false;
    $ends_line_level = NULL;
    $json_length = strlen($json);

    for ($i = 0; $i < $json_length; $i++) {
        $char = $json[$i];
        $new_line_level = NULL;
        $post = "";
        if ($ends_line_level !== NULL) {
            $new_line_level = $ends_line_level;
            $ends_line_level = NULL;
        }
        if ($in_escape) {
            $in_escape = false;
        } else if ($char === '"') {
            $in_quotes = !$in_quotes;
        } else if (!$in_quotes) {
            switch ($char) {
                case '}': case ']':
                    $level--;
                    $ends_line_level = NULL;
                    $new_line_level = $level;
                    break;

                case '{': case '[':
                    $level++;
                case ',':
                    $ends_line_level = $level;
                    break;

                case ':':
                    $post = " ";
                    break;

                case " ": case "&nbsp;": case "<br>": case "\r":
                    $char = "";
                    $ends_line_level = $new_line_level;
                    $new_line_level = NULL;
                    break;
            }
        } else if ($char === '\\') {
            $in_escape = true;
        }
        if ($new_line_level !== NULL) {
            $result .= "</br>" . str_repeat("&nbsp;&nbsp;&nbsp;&nbsp;", $new_line_level);
        }
        $result .= $char . $post;
    }
    return $result;
}

/**
 * It will check json is valid or not
 * @param type $string
 * @return type
 * @author Vijay Vyas <vijayvyas365@gmail.com>
 */
function json_validate($string) {
    $result = json_decode($string);
    switch (json_last_error()) {
        case JSON_ERROR_NONE:
            $error = ''; // JSON is valid // No error has occurred
            break;
        case JSON_ERROR_DEPTH:
            $error = 'The maximum stack depth has been exceeded.';
            break;
        case JSON_ERROR_STATE_MISMATCH:
            $error = 'Invalid or malformed JSON.';
            break;
        case JSON_ERROR_CTRL_CHAR:
            $error = 'Control character error, possibly incorrectly encoded.';
            break;
        case JSON_ERROR_SYNTAX:
            $error = 'Syntax error, malformed JSON.';
            break;
        case JSON_ERROR_UTF8:
            $error = 'Malformed UTF-8 characters, possibly incorrectly encoded.';
            break;
        case JSON_ERROR_RECURSION:
            $error = 'One or more recursive references in the value to be encoded.';
            break;
        case JSON_ERROR_INF_OR_NAN:
            $error = 'One or more NAN or INF values in the value to be encoded.';
            break;
        case JSON_ERROR_UNSUPPORTED_TYPE:
            $error = 'A value of a type that cannot be encoded was given.';
            break;
        default:
            $error = 'Unknown JSON error occured.';
            break;
    }

    if ($error !== '') {
        exit($error);
    }
    return $result;
}
