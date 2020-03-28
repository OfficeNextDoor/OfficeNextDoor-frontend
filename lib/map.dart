import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  GlobalKey<ScaffoldState >scaffoldKey = GlobalKey<ScaffoldState>();

  static final CameraPosition _kZurich = CameraPosition(
    target: LatLng(47.36667, 8.54),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      drawer : buildDrawer(context),
      body: Stack(
        children: <Widget> [
          new Center(
            child : GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kZurich,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }
            )
          ),
          Positioned(
            left: 10,
            top: 20,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the second screen using a named route.
          Navigator.pushNamed(context, '/second');
        },
        label: Text('DetailPage!'),
        icon: Icon(Icons.directions_boat),
      ));
  }

  Drawer buildDrawer(BuildContext context) {
    return new Drawer(
        child: ListView(
          // Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Insert Logo Here'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Offer a workplace'),
              onTap: () {
                // Do nothing for now
                Navigator.pop(context);
              },
            ),
          ]));
  }
}

