<? include("header.php"); ?>
  <h2>Contact</h2>
<form action="send_email.php" method="POST" enctype="text/plain">
Name:<br>
<input type="text" name="name" value="Jane Smith"><br>
Subject:<br>
<input type="text" name="subject" value="Enter subject"><br>
Content:<br>
<input type="text" name="message" value="Enter message"><br>
<br>
<input type="submit" value="Send">
</form>

<a href= "index.php"> Back to main page</a>

<? include("footer.php");?>
