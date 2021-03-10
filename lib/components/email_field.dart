import 'package:flutter/material.dart';
import 'package:test_form/helpers/email_validator.dart';

class EmailField extends StatelessWidget {
  final Function onChange;
  final TextEditingController emailController;

  EmailField({this.onChange, this.emailController});

  final InputDecoration decoratedInput = new InputDecoration(
    labelText: 'Email*',
    hintText: 'Enter your email',
    fillColor: Colors.grey,
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(25.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: decoratedInput,
      validator: (value) {
        String _validatedEmail = validateEmail(value);
        return _validatedEmail;
      },
      onChanged: this.onChange,
      onSaved: (value) => value,
    );
  }
}
