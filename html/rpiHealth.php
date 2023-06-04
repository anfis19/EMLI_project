<?php
    #echo "Download link: <br>";
    #echo '<a href="rpiHealthDownload.php>"10.42.0.1/rpiHealthDownload.php </a> <br>';
    #echo "\n";
    #echo "\n";

    header("Content-type: text/plain");
    echo file_get_contents( "performanceLog.txt" );
?>