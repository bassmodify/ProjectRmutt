import 'package:application_project/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String initialRoute = '/login';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) async {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        initialRoute = '/text';
      }
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
