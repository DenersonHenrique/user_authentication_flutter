import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication_flutter/app/common/constants/app_string.dart';
import 'package:user_authentication_flutter/app/common/widgets/custom_form_field_widget.dart';
import 'package:user_authentication_flutter/app/modules/authentication/ui/authentication/controller/authentication_controller.dart';

enum AuthMode { Authenticate, Signup }

class AuthenticationFormWidget extends StatefulWidget {
  const AuthenticationFormWidget({Key? key}) : super(key: key);

  @override
  _AuthenticationFormWidgetState createState() =>
      _AuthenticationFormWidgetState();
}

class _AuthenticationFormWidgetState extends State<AuthenticationFormWidget> {
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  late AuthenticationController authenticationController;
  bool _passwordVisible = true;
  AuthMode _authMode = AuthMode.Authenticate;
  final _form = GlobalKey<FormState>();
  bool _isAuthenticate() => _authMode == AuthMode.Authenticate;

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();
  }

  Future<void> submit() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState?.save();

    try {
      if (_isAuthenticate()) {
        authenticationController.authenticateUser();
      } else {
        authenticationController.signUpUser();
      }
    } catch (e) {}
  }

  void _switchAuthMode() {
    if (_isAuthenticate()) {
      setState(() => _authMode = AuthMode.Signup);
    } else {
      setState(() => _authMode = AuthMode.Authenticate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: emailController,
                hint: AppString.authenticationUserInput,
                prefix: Icon(Icons.mail),
                textInputType: TextInputType.emailAddress,
                onSaved: (value) => authenticationController.setEmail(value),
                validator: (text) =>
                    text!.isEmpty ? AppString.fieldCannotEmpty : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: passwordController,
                hint: AppString.authenticationPasswordInput,
                obscureText: _passwordVisible,
                prefix: Icon(Icons.vpn_key),
                suffix: IconButton(
                  onPressed: () => setState(() {
                    _passwordVisible = !_passwordVisible;
                  }),
                  icon: _passwordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                onSaved: (value) => authenticationController.setPassword(value),
                validator: (text) =>
                    text!.isEmpty ? AppString.fieldCannotEmpty : null,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: submit,
                  child: Text(
                    _isAuthenticate()
                        ? AppString.authenticationSignInButton
                        : AppString.authenticationSignUpButton,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0A5B9D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                    _isAuthenticate()
                        ? AppString.authenticationSignUpButton
                        : AppString.authenticationSignInButton,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
