import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakeproject/screen/auth_checker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          color: Colors.indigo,
        ),
      ),
      enableLog: true,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () => Get.off(AuthChecker()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Flutter InTake Sound",
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
