import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends GetxService {
  // request all permissions here
  Future<void> requestPermission() async {
    await [
      Permission.storage,
      Permission.locationWhenInUse,
      Permission.camera,
    ].request();
  }


  Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    if (status.isDenied) {
      if (status.isGranted) return true;
      return false;
    }
    return true;
  }

  Future<bool> requestLocationPermission() async {
    if (await Permission.locationWhenInUse.isDenied) {
      final status = await Permission.locationWhenInUse.request();
      if (status.isGranted) return true;
      return false;
    } else if (await Permission.locationWhenInUse.isPermanentlyDenied) {
      return await openAppSettings();
    }
    return true;
  }

  Future<bool> requestCameraPermission() async {
    if (await Permission.camera.isDenied) {
      final status = await Permission.camera.request();
      if (status.isGranted) return true;
      return false;
    } else if (await Permission.camera.isPermanentlyDenied) {
      return await openAppSettings();
    }
    return true;
  }
}
