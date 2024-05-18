import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/utils/permission_handlers.dart';

class MapController extends GetxController {
  bool isLoading = false;
  LatLng? latLng;
  List<String>? listObjPoly = [];
  Set<Marker> marker = {};
  bool isGranted = false;

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  Future<void> getCurrentLocation() async {
    update();
    final permissionGranted =
        await Get.put(PermissionHandler()).requestLocationPermission();

    if (permissionGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latLng = LatLng(position.latitude, position.longitude);
      isGranted = true;
    } else {
      isGranted = false;
    }
  }

  void shareLocation(LatLng latLng) async {
     update();
    await Share.share(
        'https://www.google.com/maps/search/?api=1&query=${latLng?.latitude},${latLng?.longitude}',
        subject: "Share My Location");
  }
}
