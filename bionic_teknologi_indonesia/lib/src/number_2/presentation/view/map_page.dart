import 'dart:async';

import 'package:bionic_teknologi_indonesia/common/custom_button.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});
  static const String mapRoute = "map-route";

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapController>(
        init: MapController(),
        builder: (MapController controller) => controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: CustomButton(
                  onPressed: () async {
                    if (controller.isGranted) {
                      controller.shareLocation(LatLng(
                          controller.latLng!.latitude,
                          controller.latLng!.longitude));
                    } else {
                      controller.getCurrentLocation();
                    }
                  },
                  text: "Share Location",
                  colorText: ColorApp.white,
                ),
              ),
      ),
    );
  }
}
