import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: openMapsWithDirection,
          color: Colors.purple,
          child: const Text('Open '),
        ),
      ),
    );
  }

  openMapsWithDirection() async {
    try {
      final availableMaps = await MapLauncher.installedMaps;
      print(
          'MUR MAPS AVAILABLE:: $availableMaps'); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

      await availableMaps[2].showDirections(
          destination: Coords(23.2358, 77.3986),
          directionsMode: DirectionsMode.walking);
    } catch (e) {
      print('MUR CATCH:: $e');
    }
  }
}
