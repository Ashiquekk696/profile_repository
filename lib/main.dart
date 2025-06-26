import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; 
import 'package:profile_editor/app.dart';
import 'di/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
 await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileApp();
  }
}