import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:registration_app/bloc/register_event.dart';
import 'package:registration_app/bloc/register_state.dart';
import 'package:registration_app/model/register_response.dart';
import 'package:registration_app/provider/register_provider.dart';
import 'package:registration_app/util/server_constants.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  // Ideally provider should be encapsulated in a repository where dio will be
  // initialized and configured to fill token in each request header. But since
  // we don't need to intercept we are directly providing it here
  final RegisterProvider provider =
      RegisterProvider(Dio(BaseOptions(baseUrl: baseUrl, method: 'POST')));
  RegistrationState get initialState => RegistrationInitialState();

  RegistrationBloc() : super(RegistrationInitialState()) {
    on<Register>(_mapRegisterEventToState);
  }

  void _mapRegisterEventToState(
      Register event, Emitter<RegistrationState> emit) async {
    try {
      RegisterResponse response = await provider.register(event.request);
      emit(RegistrationSuccessState(response.message ?? 'No message'));
    } on Exception catch (_) {
      emit(RegistrationFailedState("Server Error"));
    }
  }
}
