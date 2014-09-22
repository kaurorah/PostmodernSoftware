<? 
$mysqli= new mysqli("crcp3320db.humanoriented.com", "khabeck", "Crcp3320", "khabeck");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$id = $_GET["id"];
echo "$id";
$results = $mysqli-> query("SELECT id, title FROM examples WHERE id = " . $id . ";");
$row = $results->fetch_assoc();
$film_title = $row["title"];
?>
<!doctype html>
<html lang = "en-US">	
<head><title>Film <?film_title ?></title></head>
<body>
	<h1><?= $film_title?></h2>

	<p>film data here...</p>

	<a href="edit_films_page.php?id=<?echo $id;?>&title=<?echo $film_title;?>">Update this entry</a>

	<a href="films.php">Back to main page</a>

</body>
</html>
<? mysqli_close($mysqli); ?>