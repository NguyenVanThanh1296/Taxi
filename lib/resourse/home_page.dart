import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/resourse/widgets/home_menu.dart';

import 'widgets/ride_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static const LatLng _kMapCenter = LatLng(21.016869726546958, 105.78388531983768);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.4746, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: _kInitialPosition,
            ),
            Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: const Text(
                    'Taxi app',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  leading: TextButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset("assets/ic_menu_24x24.png"),
                  ),
                  actions: [
                    Image.asset("assets/ic_appointment_reminders_24x24.png"),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: RidePicker(),
            )
          ],
        ),
      ),
      drawer: const Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
