<?php
function combo($name, $connect = "", $sql = "", $selected = "", $arr = []){ 
    if (empty($arr)){
    $arr = get_arr($name, $connect, $sql);
    }
    $str = "<select name=$name class='combobox' >";
    foreach($arr as $key=>$value){
        $str .= "<option value='".$key."' ";
        if ($key == $selected) $str.='selected';
        $str .= ">".$value."</option>";
    }
    $str .= "</select>";
    return $str;
}

function get_arr($name, $connect, $sql){
    $query = $connect->query($sql);
    $arr = [];
     while($r = $query ->fetch(PDO::FETCH_OBJ)){
        $arr[$r->id] = $r->$name;
    }
    return $arr;
}

function checkbox($name, $connect, $sql, $selected = []){
     $arr = get_arr($name, $connect, $sql);
     $str = "";
     foreach($arr as $key=>$value){
        $str .= "<p><input name=".$name."[".$key."] type='checkbox' value='".$key."' ";
        if (!empty($selected)){
            if ($value == $selected[$key]) $str .='checked';
        }
            $str .= "/>".$value."</p>";
    } 
    return $str;
}
function combo_choose($name, $connect, $sql, $func){
    $arr = get_arr($name, $connect, $sql);
    $str = "<select name=$name class='combobox' onchange='$func' ><option value='' disabled selected>Выберите...</option>";
    foreach($arr as $key=>$value){
        $str .= "<option value='".$key."' ";
        $str .= ">".$value."</option>";
    }
    $str .= "</select>";
    return $str;  
}
?>
