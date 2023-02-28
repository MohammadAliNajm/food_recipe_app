import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/constants/Colors.dart';

class FormTextField extends StatelessWidget {
  const FormTextField(
      {this.hint,
      required this.controller,
      this.icon,
      required this.validator,
      this.password,
      this.last,
      this.readOnly,
      required this.email,
      this.padding, this.hasOnChanged});
  final double? padding;
  final String? hint;
  final TextEditingController controller;
  final Icon? icon;
  final bool validator;
  final bool? password;
  final bool? last;
  final bool? readOnly;
  final bool email;
  final Function(String)? hasOnChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0),
      child: TextFormField(
        readOnly: readOnly ?? false,
        toolbarOptions: const ToolbarOptions(
            copy: true, paste: true, selectAll: true, cut: true),
        obscureText: password ?? false,
        textInputAction: last == null ? null : TextInputAction.next,
        keyboardType: email ? TextInputType.emailAddress : null,
        validator: validator
            ? (value) {
                if (value == null) {
                  return 'Please complete field';
                } else if (email && !EmailValidator.validate(value)) {
                  return "Please write a valid email";
                } else if (value.isEmpty) {
                  return 'Please complete field';
                } else if (value.length < 6 && password == true) {
                  return 'Password is too short';
                } else {
                  return null;
                }
              }
            : null,
        onSaved: (newValue) {
          controller.text = newValue!;
        },
        onChanged: hasOnChanged != null ? hasOnChanged : null,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greyColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greenColor))),
      ),
    );
  }
}
