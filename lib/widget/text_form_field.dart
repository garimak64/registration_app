import 'package:flutter/material.dart';
/*
This class can be moved to a different package called components where all
reusable components can be kept
 */
class CustomFormField extends StatelessWidget {
  final String? Function(String?) validator;
  final String labelText;
  final TextEditingController textEditingController;
  final bool? isObscure;
  final bool? isNumericKeyboard;
  const CustomFormField(
      {Key? key,
      required this.validator,
      required this.labelText,
      required this.textEditingController,
      this.isObscure,
      this.isNumericKeyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        validator: validator,
        keyboardType: isNumericKeyboard ?? false ? TextInputType.phone : null,
        controller: textEditingController,
        showCursor: true,
        obscureText: isObscure ?? false,
        style: const TextStyle(
            color: Colors.white
        ),
        onTap: () {},
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
             borderSide: BorderSide(color: Colors.white)
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white
          ),
        )
      ),
    );
  }
}
