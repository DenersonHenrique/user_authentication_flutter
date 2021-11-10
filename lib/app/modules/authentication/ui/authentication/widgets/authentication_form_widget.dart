import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication_flutter/app/utils/auth_utils.dart';
import 'package:user_authentication_flutter/app/common/constants/app_string.dart';
import 'package:user_authentication_flutter/app/utils/form_field_validations.dart';
import 'package:user_authentication_flutter/app/common/widgets/custom_form_field_widget.dart';
import 'package:user_authentication_flutter/app/modules/authentication/ui/authentication/controller/authentication_controller.dart';

enum AuthMode { Authenticate, Signup }

class AuthenticationFormWidget extends StatefulWidget {
  const AuthenticationFormWidget({Key? key}) : super(key: key);

  @override
  _AuthenticationFormWidgetState createState() =>
      _AuthenticationFormWidgetState();
}

class _AuthenticationFormWidgetState extends State<AuthenticationFormWidget>
    with SingleTickerProviderStateMixin {
  late AuthenticationController authenticationController;
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  bool _passwordVisible = true;
  final _form = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Authenticate;
  bool _isAuthenticate() => _authMode == AuthMode.Authenticate;

  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  void _switchAuthMode() {
    if (_isAuthenticate()) {
      setState(() => _authMode = AuthMode.Signup);
      _animationController?.forward();
    } else {
      setState(() => _authMode = AuthMode.Authenticate);
      _animationController?.reverse();
    }
  }

  Future<void> submit() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    _form.currentState?.save();

    try {
      await authenticationController.authenticateUser(
        AuthUtils.authAction(_isAuthenticate()),
      );
    } catch (error) {}
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
                validator: (text) => FieldValidation.isEmpty(text),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormFieldWidget(
                controller: _passwordController,
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
                validator: (text) => FieldValidation.valueLength(text, 6),
              ),
            ),
            AnimatedContainer(
              constraints: BoxConstraints(
                minHeight: _isAuthenticate() ? 0 : 80,
                maxHeight: _isAuthenticate() ? 0 : 160,
              ),
              duration: Duration(milliseconds: 600),
              curve: Curves.linear,
              child: FadeTransition(
                opacity: _opacityAnimation!,
                child: SlideTransition(
                  position: _slideAnimation!,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFormFieldWidget(
                      hint: AppString.authenticationConfirmPasswordInput,
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
                      validator: _isAuthenticate()
                          ? null
                          : (value) {
                              if (value != _passwordController?.text) {
                                return AppString.notConfirmedPassword;
                              }
                              return null;
                            },
                    ),
                  ),
                ),
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
