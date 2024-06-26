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

  factory BiometricAvailabilty.fromJson(json) =>
      _$BiometricAvailabiltyFromJson(json);

  Map<String, dynamic> toJson() => _$BiometricAvailabiltyToJson(this);
}
