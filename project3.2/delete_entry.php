<? 
 $mysqli= new mysqli("crcp3320db.humanoriented.com", "khabeck", "Crcp3320", "khabeck");
 if ($mysqli->connect_errno) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$id= $_GET['id'];
$title= $_GET['title'];
mysqli_query($mysqli,"DELETE FROM examples WHERE id = $id;");
?>

<!doctype html>
<html>
<head>
	<title>Delete Successful</title>
</head>
<body>
<h2><?=$title?> deleted</h2>

<a href="films.php">Return home</a>
</body>
</html>

<? mysqli_close($mysqli); ?>