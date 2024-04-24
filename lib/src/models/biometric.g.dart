// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BiometricAvailabiltyCWProxy {
  BiometricAvailabilty message(String message);

  BiometricAvailabilty canAuthenticate(bool canAuthenticate);

  BiometricAvailabilty availableBiometrics(
      List<BiometricType> availableBiometrics);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BiometricAvailabilty(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BiometricAvailabilty(...).copyWith(id: 12, name: "My name")
  /// ````
  BiometricAvailabilty call({
    String? message,
    bool? canAuthenticate,
    List<BiometricType>? availableBiometrics,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBiometricAvailabilty.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBiometricAvailabilty.copyWith.fieldName(...)`
class _$BiometricAvailabiltyCWProxyImpl
    implements _$BiometricAvailabiltyCWProxy {
  const _$BiometricAvailabiltyCWProxyImpl(this._value);

  final BiometricAvailabilty _value;

  @override
  BiometricAvailabilty message(String message) => this(message: message);

  @override
  BiometricAvailabilty canAuthenticate(bool canAuthenticate) =>
      this(canAuthenticate: canAuthenticate);

  @override
  BiometricAvailabilty availableBiometrics(
          List<BiometricType> availableBiometrics) =>
      this(availableBiometrics: availableBiometrics);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BiometricAvailabilty(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BiometricAvailabilty(...).copyWith(id: 12, name: "My name")
  /// ````
  BiometricAvailabilty call({
    Object? message = const $CopyWithPlaceholder(),
    Object? canAuthenticate = const $CopyWithPlaceholder(),
    Object? availableBiometrics = const $CopyWithPlaceholder(),
  }) {
    return BiometricAvailabilty(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      canAuthenticate: canAuthenticate == const $CopyWithPlaceholder() ||
              canAuthenticate == null
          ? _value.canAuthenticate
          // ignore: cast_nullable_to_non_nullable
          : canAuthenticate as bool,
      availableBiometrics:
          availableBiometrics == const $CopyWithPlaceholder() ||
                  availableBiometrics == null
              ? _value.availableBiometrics
              // ignore: cast_nullable_to_non_nullable
              : availableBiometrics as List<BiometricType>,
    );
  }
}

extension $BiometricAvailabiltyCopyWith on BiometricAvailabilty {
  /// Returns a callable class that can be used as follows: `instanceOfBiometricAvailabilty.copyWith(...)` or like so:`instanceOfBiometricAvailabilty.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BiometricAvailabiltyCWProxy get copyWith =>
      _$BiometricAvailabiltyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiometricAvailabilty _$BiometricAvailabiltyFromJson(
        Map<String, dynamic> json) =>
    BiometricAvailabilty(
      message: json['message'] as String,
      canAuthenticate: json['canAuthenticate'] as bool,
      availableBiometrics: (json['availableBiometrics'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$BiometricTypeEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BiometricAvailabiltyToJson(
        BiometricAvailabilty instance) =>
    <String, dynamic>{
      'message': instance.message,
      'canAuthenticate': instance.canAuthenticate,
      'availableBiometrics': instance.availableBiometrics
          .map((e) => _$BiometricTypeEnumMap[e]!)
          .toList(),
    };

const _$BiometricTypeEnumMap = {
  BiometricType.face: 'face',
  BiometricType.fingerprint: 'fingerprint',
  BiometricType.iris: 'iris',
  BiometricType.strong: 'strong',
  BiometricType.weak: 'weak',
};
