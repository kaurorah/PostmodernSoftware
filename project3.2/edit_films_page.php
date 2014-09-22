<?
$id = $_GET["id"];
$title=$_GET["title"];
?>


<!doctype html>
<html>
<head>
	<title>Edit Films</title>
</head>
<body>
<h1>Update Entry</h1>
<form action="edit_entry.php" method="POST">
  <input type="hidden" name="id" value=<?=$id?> />
  <label for="title">Film Title</label>
  <input type="text" name="title" value=<?=$title?> />
  <input type="submit" value="Submit" />
</form>


<a href="films.php">Back to list</a>
</body>
</html>