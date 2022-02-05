import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/bloc/bloc.dart';
import 'package:registration_app/bloc/register_event.dart';
import 'package:registration_app/bloc/register_state.dart';
import 'package:registration_app/util/field_validator_mixin.dart';
import 'package:registration_app/model/register_request.dart';
import 'package:registration_app/widget/text_form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>
    with FieldValidatorMixin {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _genderController;
  late TextEditingController _phoneController;
  late Bloc<RegistrationEvent, RegistrationState> _registrationBloc;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _registrationBloc = BlocProvider.of<RegistrationBloc>(context);
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _genderController = TextEditingController();
    _phoneController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _registrationBloc,
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
          setState(() {
            showSnackBar(context, state.message);
          });
        } else if (state is RegistrationFailedState) {
          setState(() {
            showSnackBar(context, state.message);
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomFormField(
              textEditingController: _emailController,
              validator: (_) => validateEmail(_emailController.text),
              labelText: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              textEditingController: _nameController,
              validator: (_) => validateName(_nameController.text),
              labelText: 'Full Name',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              textEditingController: _passwordController,
              validator: (_) => validatePassword(_passwordController.text),
              labelText: 'Password',
              isObscure: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
                validator: (_) => validateGender(_genderController.text),
                labelText: 'Gender',
                textEditingController: _genderController),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              validator: (_) => validatePhone(_phoneController.text),
              textEditingController: _phoneController,
              labelText: 'Phone',
              isNumericKeyboard: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  showSnackBar(context, 'Invalid details');
                } else {
                  _registrationBloc.add(Register(
                      request: RegistrationRequest(
                          email: _emailController.text,
                          fullName: _nameController.text,
                          password: _passwordController.text,
                          phone: _phoneController.text,
                          gender: _genderController.text)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
