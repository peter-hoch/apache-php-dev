<html>
    <body>
    <h3>
        <?php 
            echo "server: " . $_SERVER["HTTP_HOST"] .  "<br> scheme: " . $_SERVER["REQUEST_SCHEME"] . "<br>path: " . $_SERVER['PHP_SELF'] . "<br>RemoteAddress: " . $_SERVER['REMOTE_ADDR']; 
        ?>
    </h3>

    <pre>
<?php

    //setcookie('foo', 'bar');

    echo "\nPOSTs\n";
    foreach($_POST as $key => $value)
    {
        echo "  " . $key." => ".$value . "\n";
    }
    echo "\nGETs\n";
    foreach($_GET as $key => $value)
    {
        echo "  " . $key." => ".$value . "\n";
    }
    echo "\nCOOKIEs\n";
    foreach($_COOKIE as $key => $value)
    {
        echo "  " . $key." => ".$value . "\n";
    }
    echo "\nRequestHeaders\n";
    $headers = apache_request_headers();
    foreach ($headers as $header => $value) 
    {
        echo "$header: $value \n";
    }
    echo "\n'all' response headers:\n";
    foreach(headers_list() as $key => $value)
    {
        echo "[$key] =>  $value \n";
    }

?>
    </pre>

    </body>
</html>