import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:device_preview/device_preview.dart';

class MechanicMapPage extends StatelessWidget {
  const MechanicMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example coordinates for the mechanic (e.g., Paris)
    final mechanicLocation = const LatLng(48.8566, 2.3522);

    return Scaffold(
      appBar: AppBar(title: const Text('Mechanic on Map'), centerTitle: true),
      body: FlutterMap(
        options: MapOptions(initialCenter: mechanicLocation, initialZoom: 14.0),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: mechanicLocation,
                width: 60.0,
                height: 60.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 3.0, // Blue line around the image
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/mechanic.png'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: const MechanicMapPage(),
      ),
    ),
  );
}
