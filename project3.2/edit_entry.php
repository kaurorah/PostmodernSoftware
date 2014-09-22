<?
 $mysqli= new mysqli("crcp3320db.humanoriented.com", "khabeck", "Crcp3320", "khabeck");
 if ($mysqli->connect_errno) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$title= $_POST['title'];
$id= $_POST['id'];

mysqli_query($mysqli,"UPDATE examples SET title='$title' WHERE id='$id';");
?>

<!doctype html>
<html>
<head>
	<title>Update Successful</title>
</head>
<body>
<h2><?=$title?> updated</h2>

<a href="films.php">Return home</a>
</body>
</html>

<? mysqli_close($mysqli); ?>