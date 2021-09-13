import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:user_authentication_flutter/app/common/constants/app_string.dart';
import 'package:user_authentication_flutter/app/common/widgets/custom_form_field_widget.dart';
import 'package:user_authentication_flutter/app/modules/authentication/ui/authentication/controller/authentication_controller.dart';

class AuthenticationFormWidget extends StatefulWidget {
  const AuthenticationFormWidget({Key? key}) : super(key: key);

  @override
  _AuthenticationFormWidgetState createState() =>
      _AuthenticationFormWidgetState();
}

class _AuthenticationFormWidgetState extends State<AuthenticationFormWidget> {
  final TextEditingController? userController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  late AuthenticationController authenticationController;
  bool passwordVisible = true;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: userController,
                hint: AppString.authenticationUserInput,
                prefix: Icon(Icons.mail),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: passwordController,
                hint: AppString.authenticationPasswordInput,
                obscureText: passwordVisible,
                prefix: Icon(Icons.vpn_key),
                suffix: IconButton(
                  onPressed: () => setState(() {
                    passwordVisible = !passwordVisible;
                  }),
                  icon: passwordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: authenticationController.authenticateUser,
              child: Text(AppString.authenticationSignInButton),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
