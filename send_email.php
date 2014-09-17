
<? 
include("header.php");
    $from = $_POST["name"];
    $subject = $_POST["subject"];
    $message = $_POST["message"];

    mail("khabeck@smu.edu",$subject,$message);
  
  	echo "Email sent!"; 
include("footer.php");

   ?> 