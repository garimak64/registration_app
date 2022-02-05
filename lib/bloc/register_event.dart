import 'package:meta/meta.dart';
import 'package:registration_app/model/register_request.dart';

@immutable
abstract class RegistrationEvent {}

class Register extends RegistrationEvent {
  final RegistrationRequest request;
  Register({required this.request});
}
