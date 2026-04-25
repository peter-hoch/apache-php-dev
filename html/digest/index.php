
<html>
    <body>
    <h3><?php echo "server: " . $_SERVER["HTTP_HOST"] .  "<br> scheme: " . $_SERVER["REQUEST_SCHEME"] . "<br>path: " . $_SERVER['PHP_SELF']; ?></h3>
    <pre>
<?php
    echo "POSTs\n";
    foreach($_POST as $key => $value)
    {
        echo "  " . $key." => ".$value . "\n";
    }
    echo "GETs\n";
    foreach($_GET as $key => $value)
    {
        echo "  " . $key." => ".$value . "\n";
    }
    echo "COOKIEs\n";
    foreach($_COOKIE as $key => $value)
    {
        echo "  " . $key." => ".$value . "\n";
    }
?>
    </pre>
    <br>
        <a href="info.php">php info</a>
        <br>
    </body>
</html>
    