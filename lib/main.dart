import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app =  await Firebase.initializeApp();
  runApp(App());
}

