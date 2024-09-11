<?php
require "connection.php";


if(isset($_GET["id"])){

    $pro_id = $_GET["id"];

    $pro_rs =Database::search("SELECT * FROM `product` WHERE `id` ='".$pro_id."'");

    $pro_num = $pro_rs->num_rows;

    if($pro_num == 1){
        $pro_data = $pro_rs->fetch_assoc();

        if($pro_data["status_id"]  == 1){
            Database::iud("UPDATE `product` SET `status_id`='2' WHERE `id` ='".$pro_id."'");
            echo("blocked");
        }else if($pro_data["status_id"] == 2){
            Database::iud("UPDATE `product` SET `status_id`='1' WHERE `id` ='".$pro_id."'");
            echo("unblocked");
        }

    }else{
        echo("Cannot find user.Please try again later");
    }
}else{
 echo("Something went wrong.");
}
?>