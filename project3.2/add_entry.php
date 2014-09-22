<?
 $mysqli= new mysqli("crcp3320db.humanoriented.com", "khabeck", "Crcp3320", "khabeck");
 if ($mysqli->connect_errno) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$title= $_POST['title'];

mysqli_query($mysqli,"INSERT INTO examples(title) VALUES('$title')");

?>

<!doctype html>
<html>
<head>
	<title>Add Successful</title>
</head>
<body>
<h2><?=$title?> added</h2>

<a href="films.php">Return home</a>
</body>
</html>

<? mysqli_close($mysqli); ?>