import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sharedkits/shared_utils.dart';

import '../models/biometric.dart';

class LocalAuth {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> hasFaceId() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    return availableBiometrics.contains(BiometricType.face);
  }

  Future<BiometricAvailabilty> canCheckBiometrics() async {
    bool canAuthenticate = await auth.canCheckBiometrics;
    bool isAvailable = await auth.isDeviceSupported();
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    BiometricAvailabilty result = BiometricAvailabilty(
      message: "Initial Biometeri",
      availableBiometrics: availableBiometrics,
      canAuthenticate: canAuthenticate,
    );

    //-----> check if the device has biometric and has also been setup
    if (isAvailable && canAuthenticate && availableBiometrics.isNotEmpty) {
      result = result.copyWith(
        canAuthenticate: true,
        message: "Ready to authenticate.",
      );
    }
    if (isAvailable && canAuthenticate && availableBiometrics.isEmpty) {
      result = result.copyWith(
        canAuthenticate: false,
        message: "No Biometric device availbale.",
      );
    }
    //-----> check if the device has biometric and can  be used but not set up yet

    if (isAvailable && !canAuthenticate) {
      result = result.copyWith(
        message:
            "This device supports biometry but cannot be used due to an error.",
        canAuthenticate: false,
      );
    }

    //------>  The device does not have any biometric capabilities
    if (!isAvailable && canAuthenticate) {
      result = result.copyWith(
        message: "This device does not support biometric.",
        canAuthenticate: false,
      );
    }

    return result;
  }

  Future<bool> authenticate([String reason = "Please authenticate"]) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: reason,
      );

      return didAuthenticate;
      // ···
    } on PlatformException catch (e) {
      // ...

      logger.e(e);
      return false;
    }
  }
}
