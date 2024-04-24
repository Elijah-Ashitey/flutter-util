import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'biometric.g.dart';

@CopyWith()
@JsonSerializable()
class BiometricAvailabilty {
  final String message;
  final bool canAuthenticate;
  final List<BiometricType> availableBiometrics;

  BiometricAvailabilty({
    required this.message,
    required this.canAuthenticate,
    this.availableBiometrics = const [],
  });

  BiometricAvailabilty copyWith({
    String? message,
    bool? canAuthenticate,
    List<BiometricType>? availableBiometrics,
  }) {
    return BiometricAvailabilty(
      message: message ?? this.message,
      canAuthenticate: canAuthenticate ?? this.canAuthenticate,
      availableBiometrics: availableBiometrics ?? this.availableBiometrics,
    );
  }
}
