import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
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
  bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();
  }

  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    authenticationController.authenticateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                textInputType: TextInputType.emailAddress,
                validator: (text) => text == null || text.isEmpty
                    ? AppString.fieldCannotEmpty
                    : null,
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
                validator: (text) => text == null || text.isEmpty
                    ? AppString.fieldCannotEmpty
                    : null,
              ),
            ),
            ElevatedButton(
              onPressed: submit,
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
