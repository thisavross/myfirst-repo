import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMapsPage extends StatefulWidget {
  const GMapsPage({super.key});

  @override
  State<GMapsPage> createState() => _GMapsPageState();
}

class _GMapsPageState extends State<GMapsPage> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('google maps example'),
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194),
            zoom: 12,
          ),
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;

            setState(() {
              _markers.add(
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(37.7749, -122.4194),
                  onTap: () {
                    _showInfoWindow();
                  },
                ),
              );
            });
          }),
    );
  }

  void _showInfoWindow() {
    _controller?.showMarkerInfoWindow(MarkerId('1'));
  }
}
