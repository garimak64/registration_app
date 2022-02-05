import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {
  final String message;
  RegistrationSuccessState(this.message);
}

class RegistrationFailedState extends RegistrationState {
  final String message;
  RegistrationFailedState(this.message);
}
