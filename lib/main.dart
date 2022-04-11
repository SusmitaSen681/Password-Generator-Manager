import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:password_generator_managing_app/page/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(0, 233, 119, 119)));
}

class MyApp extends StatelessWidget {
  

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      
      themeMode: ThemeMode.light,
      theme: ThemeData(
       // primarySwatch: Colors.transparent,
       
        
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: Splash());
}
