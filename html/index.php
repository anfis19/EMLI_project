<?php
echo "The following links are possible to visit:<br>";
echo '<a href="rpiHealth.php">10.42.0.1/rpiHealth.php</a> <br>';
echo '<a href="sensor.php">10.42.0.1/sensor.php</a> <br>';
echo '<a href="sensorNoInternet.php">10.42.0.1/sensorNoInternet.php</a> <br><br>';

echo "The rpiHealth site will show the health data for the RPi. <br>";
echo "The sensor site will show sensor values logged, along with the serial port it is collected from. <br>";
echo "The sensorNoInternet site shows the sensor data not able to be published online. <br> ";
echo "The data for the different sites is downloadable through the following sites:<br><br>";

echo '<a href="rpiHealthDownload.php">10.42.0.1/rpiHealthDownload.php </a> <br>';
echo '<a href="sensorDownload.php">10.42.0.1/sensorDownload.php </a> <br>';
echo '<a href="sensorNoInternetDownload.php">10.42.0.1/sensorNoInternetDownload.php </a> <br>';
?>