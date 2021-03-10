import 'package:flutter/material.dart';
import 'package:test_form/models/Users.dart';
import 'package:test_form/components/password_field.dart';
import 'package:test_form/components/email_field.dart';
import 'package:test_form/services/create_user.dart';

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final User user = new User();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              EmailField(
                emailController: emailController,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              PasswordField(
                passwordController: passwordController,
              ),
              SizedBox(height: 20),
              OutlineButton(
                color: Colors.grey,
                shape: StadiumBorder(),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    user.email = emailController.text;
                    user.password = passwordController.text;
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                    CreateUser instance =
                        CreateUser(email: user.email, password: user.password);
                    instance.saveUser();
                  }
                },
                child: Text('Зарегистрироватся'),
              ),
            ],
          ),
        ));
  }
}
