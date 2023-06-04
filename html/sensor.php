<?php
    #echo "Download link: <br>";
    #echo '<a href="rpisensorDownload.php">10.42.0.1/sensorDownload.php </a> <br>';
    #echo "\n";
    #echo "\n";

    header("Content-type: text/plain");
    echo file_get_contents( "sensorLog.txt" );
?>