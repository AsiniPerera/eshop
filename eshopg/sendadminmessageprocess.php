<?php

session_start();
require "connection.php";

$msg_txt = $_POST["t"];
$reciver= $_POST["r"];

$d =new DateTime();
$tz = new DateTimeZone("Asia/colombo");
$d->setTimezone($tz);
$date =$d->format("Y-m-d H:i:s");

$sender;

if(isset($_SESSION["u"])){

    $sender = $_SESSION["u"]["email"];

}elseif(isset($_SESSION["au"])){

    $sender =  $_SESSION["au"]["email"];

}

if(empty($reciver)){
    Database::iud("INSERT INTO `chat` (`content`,`date_time`,`status`,`from`,`to`) VAlUES
('".$msg_txt."','".$date."','0','".$sender."','".$reciver."')");

echo ("success1");

}else{
    Database::iud("INSERT INTO `chat` (`content`,`date_time`,`status`,`from`,`to`) VAlUES
    ('".$msg_txt."','".$date."','0','".$sender."','sadeepthalakindu18@gmail.com')"); 

echo ("success2");
}

?>