// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequest _$RegistrationRequestFromJson(Map<String, dynamic> json) =>
    RegistrationRequest(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$RegistrationRequestToJson(
        RegistrationRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
    };
