//  @override
// void initState() {
// super.initState();
// populateClients();
// Geolocator().getCurrentPosition().then((currloc) {
//   setState(() {
//     currentLocation = currloc;
//   });
// });
// }

//  populateClients() async {
// var pos = await Geolocator().getCurrentPosition();
// final coordinates = new coder.Coordinates(
//     pos.latitude, pos.longitude);
// var addresses = await coder.Geocoder.local.findAddressesFromCoordinates(
//     coordinates);
// var first = addresses.first;
// initializeDateFormatting();
// var format = DateFormat.d('ar');
// var dateString = format.format(DateTime.now());
// final FirebaseUser user = await _auth.currentUser();
// final uid = user.uid;
// Firestore.instance.collection('profiles')
//       .where('City', isEqualTo: first.locality)
//       .where('Days', arrayContains: dateString)
//       .where('Uid' != uid)
//       .where('role' == 'user')
//     .getDocuments().then((docs) {
//   if (docs.documents.isNotEmpty) {
//     for (int i = 0; i < docs.documents.length; i++) {
//       clients.add(docs.documents[i].data);
//       initMarker(docs.documents[i].data,
//           docs.documents[i].documentID);
//     }
//   }
// });
// }

// void initMarker(client, markerRef) {
// var markerIdVal = markerRef;
// final MarkerId markerId = MarkerId(markerIdVal);

//   final Marker marker = Marker(
//     markerId: markerId,
//     position: LatLng(double.parse(client['Location'].latitude),
//         double.parse(client['Location'].longitude)),
//     infoWindow: InfoWindow(title: "click here", snippet: "click to show the details"),
//     icon: BitmapDescriptor.defaultMarker,
//     onTap: () {
//       showAlertDialog(client);
//     }
// );

// setState(() {
// // adding a new marker to map
// markers[markerId] = marker;
// });
// }

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class CustomMarkerWithNetworkImage extends StatefulWidget {
  const CustomMarkerWithNetworkImage({Key? key}) : super(key: key);

  @override
  _CustomMarkerWithNetworkImageState createState() =>
      _CustomMarkerWithNetworkImageState();
}

class _CustomMarkerWithNetworkImageState
    extends State<CustomMarkerWithNetworkImage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<String> images = [
    'images/car.png',
    'images/car2.png',
    'images/marker2.png',
    'images/marker3.png',
    'images/marker.png',
    'images/motorcycle.png',
  ];

  final List<Marker> _markers = <Marker>[];
  List<LatLng> _latLang = [
    LatLng(0.3499986, 32.567164398),
    LatLng(0.368665192, 32.52166458),
    LatLng(.3427, 32.5613),
    LatLng(0.32166538, 32.555997776),
    LatLng(0.315682, 32.574712),
    LatLng(0.312778, 32.558333)
  ];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0.31628 ,32.58219),
    zoom: 15,
  );

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: 60);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      Uint8List? image = await _loadNetworkImage(
          'https://images.bitmoji.com/3d/avatar/201714142-99447061956_1-s5-v1.webp');

      final ui.Codec markerImageCodec = await instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 200,
        targetWidth: 200,
      );
      final FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData = await frameInfo.image.toByteData(
        format: ImageByteFormat.png,
      );

      final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _latLang[i],
        icon: BitmapDescriptor.fromBytes(resizedMarkerImageBytes),
        anchor: Offset(.1, .1),
        //icon: BitmapDescriptor.fromBytes(image!.buffer.asUint8List()),
        infoWindow: InfoWindow(title: 'We Work: ' + i.toString()),
      ));
      setState(() {});
    }
  }

  Future<Uint8List?> _loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var img = NetworkImage(path);
    img
        .resolve(const ImageConfiguration(size: Size.fromHeight(10)))
        .addListener(
            ImageStreamListener((info, _) => completer.complete(info)));
    final imageInfo = await completer.future;
    final byteData = await imageInfo.image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return byteData?.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
