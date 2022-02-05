import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(includeIfNull: true)
class RegistrationRequest {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'fullName')
  String? fullName;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'phone')
  String? phone;


  RegistrationRequest(
      {required this.email, required this.fullName, required this.password, required this.gender, required this.phone});

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);
}
