<? //Use mysqli library
$mysqli= new mysqli("crcp3320db.humanoriented.com", "khabeck", "Crcp3320", "khabeck");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$results = $mysqli->query("SELECT id, title FROM examples;");

?>
<!doctype html>
<html lang = "en-US">	
<head> 
<title>Film Data</title>
</head>
<body>
	<h1>Films</h1>
		<a href="add_films.php">Add a film</a>
	<h2>Films in the database</h2>
	<ul>
	<? while ($row= $results->fetch_assoc()){
		?>
	<li><a href ="details_films.php?id=<?echo $row['id']; ?>">	<?= $row["title"] ?>	</a>

<a onclick="confirm('Deleting entry, okay?')" href="delete_entry.php?id=<?echo $row['id']; ?>&title=<?echo $row["title"];?>">[delete]</a>

	</li>
	<? } ?>
	</ul>

</body>
</html>

<? mysqli_close($mysqli); ?>