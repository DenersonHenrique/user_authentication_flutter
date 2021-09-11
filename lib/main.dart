import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:user_authentication_flutter/app/common/di.dart';
import 'package:user_authentication_flutter/app/modules/authentication/ui/authentication/controller/authentication_controller.dart';

void main() {
  GetIt getIt = GetIt.instance;
  final appInjection = AppInjection();
  appInjection.call(getIt);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Authentication User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AuthenticationController authenticationController;

  @override
  void initState() {
    super.initState();
    authenticationController = GetIt.instance<AuthenticationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: authenticationController.authenticateUser,
              child: Text('Test Call usecase'),
            ),
          ],
        ),
      ),
    );
  }
}
