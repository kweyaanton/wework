

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class SingleJob extends StatefulWidget {
  final Map jobData;

  const SingleJob({Key? key, required this.jobData}) : super(key: key);

  @override
  State<SingleJob> createState() => _SingleJobState();
}

Geoflutterfire geo = Geoflutterfire();
 LatLng _geofenceMarkerPosition =  LatLng(0, 0);

// GeoFirePoint geoFirePoint = geo.Point(
//     latitude: geofenceMarkerLatLng.latitude,
//     longitude: geofenceMarkerLatLng.longitude);

// _firestore.collection('Geofence').add({
//   'name': '$name',
//   'latitude': geoFirePoint.latitude,
//   'longitude': geoFirePoint.longitude,

// }).then((_){
//   print('added ${geoFirePoint.hash}successfully');

// });    








class _SingleJobState extends State<SingleJob> {
  @override
  final Map<String, Marker> _markers = {};

  BitmapDescriptor? pinLocationIcon;

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 5.0),
      'assets/images/markericon.png',
    );
  }

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      final marker = Marker(
        icon: pinLocationIcon!,
        markerId: MarkerId(widget.jobData['id']),
        position: LatLng(widget.jobData['lat'], widget.jobData['lng']),
        infoWindow: InfoWindow(
            title: widget.jobData['name'],
            snippet: widget.jobData['address'],
            onTap: () {
              print("${widget.jobData['lat']}, ${widget.jobData['lng']}");
            }),
        onTap: () {
          print("Clicked on marker");
        },
      );
      print("${widget.jobData['lat']}, ${widget.jobData['lng']}");
      _markers[widget.jobData['name']] = marker;
    });
  }

  launchMap(lat, long) {
    MapsLauncher.launchCoordinates(lat, long);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About ${widget.jobData['name']}')),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                  widget.jobData['image'],
                  height: 200,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.jobData['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        launchMap(widget.jobData['lat'], widget.jobData['lng']);
                      },
                      child: const Text("Direction"),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.jobData['lat'], widget.jobData['lng']),
                zoom: 7,
              ),
              markers: _markers.values.toSet(),
            ),
          )
        ],
      ),
    );
  }
}
