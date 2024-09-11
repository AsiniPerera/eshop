<?php

require "connection.php";

if(isset($_GET["id"])){
    $invoce_id = $_GET["id"];

$invoce_rs =Database::search("SELECT * FROM `invoice` WHERE `id` ='".$invoce_id."'");
$invoce_data =$invoce_rs->fetch_assoc();

$status_id = $invoce_data["status"];
$new_status = 0;

if($status_id == 0){
    Database::iud("UPDATE `invoice` SET `status`='1' WHERE `id` = '".$invoce_id."'");
    $new_status = 1;
}elseif($status_id == 1){
    Database::iud("UPDATE `invoice` SET `status`='2' WHERE `id` = '".$invoce_id."'");
    $new_status = 2;
}elseif($status_id == 2){
    Database::iud("UPDATE `invoice` SET `status`='3' WHERE `id` = '".$invoce_id."'");
    $new_status = 3;
}elseif($status_id == 3){
    Database::iud("UPDATE `invoice` SET `status`='4' WHERE `id` = '".$invoce_id."'");
    $new_status = 4;
}
echo $new_status;
}

?>