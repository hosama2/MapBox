<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="MapBox.Map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <title>Display a map</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <script src="https://api.mapbox.com/mapbox-gl-js/v1.12.0/mapbox-gl.js"></script>
    <link href="https://api.mapbox.com/mapbox-gl-js/v1.12.0/mapbox-gl.css" rel="stylesheet" />

<style>

	body { margin: 0; padding: 0; }
	#map { position: absolute; top: 0; bottom: 0; width: 100%; }

</style>

</head>

<body>

    <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.min.js"></script>
    <link
        rel="stylesheet"
        href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.css"
        type="text/css"
    />

    <div id="map" runat="server"></div>
    

<script>

    mapboxgl.accessToken = 'pk.eyJ1Ijoib3NhbWEyMDY4IiwiYSI6ImNraThyaDhsNTA4aHUycm16Y3FuYWcybjMifQ._A3fo9VOx4CPbPxKgdgKpw';

    var map = new mapboxgl.Map({
        container: 'map', // container id
        style: 'mapbox://styles/mapbox/streets-v11', // style URL
        center: [-74.5, 40], // starting position
        zoom: 9 // starting zoom
    });

    //Initialize the geolocate control.
    var UserLocation = new mapboxgl.GeolocateControl(
        {
            PositionOption: {
                enableHighAccuracy: true
            },
            trucUserLocation: true,
            ShowUserLocation: true
        }
        );

    //Add Geocoder control to the map.
    map.addControl(new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
        })
        );


    //Add geolocate control to the map.
    map.addControl(UserLocation);

    //Locate User Location When Map Load.
    map.on('load', function () {
        UserLocation.trigger()
     }
    );

     //Add zoom and rotation controls to the map.
    map.addControl(new mapboxgl.NavigationControl());

   
</script>
 
</body>

</html>
