import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/screens/screens.dart';
import 'package:flutter_challenge/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,]
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Challenge',
      theme: AppTheme().getTheme(),
      home: const HomeScreen(),
    );
  }
}