import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/theme/theme.dart';
import 'package:my_notes_with_firebase_mvvm/utils/firebase_authentication.dart';
import 'package:my_notes_with_firebase_mvvm/utils/routes/route.dart';
import 'package:my_notes_with_firebase_mvvm/utils/routes/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuthentication.initializeFirebase();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: KString.myNotes,
      theme: KTheme().theme,
      initialRoute: KRoutesName.splash,
      onGenerateRoute: KRoute.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
