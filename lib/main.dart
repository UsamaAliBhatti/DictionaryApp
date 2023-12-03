import 'package:dictionaryapp/Presentation/LandingPage.dart';
import 'package:dictionaryapp/firebase_options.dart';
import 'package:dictionaryapp/providers/alphabet_provider.dart';
import 'package:dictionaryapp/providers/family_signs_provider.dart';
import 'package:dictionaryapp/providers/game_one_provider.dart';
import 'package:dictionaryapp/providers/login_provider.dart';
import 'package:dictionaryapp/providers/reset_password_provider.dart';
import 'package:dictionaryapp/providers/signup_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      // Shows Status bar and hides Navigation bar
    ],
  );
  //sd
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
          ChangeNotifierProvider<SignUpProvider>(
              create: (_) => SignUpProvider()),
          ChangeNotifierProvider<ResetPasswordProvider>(
              create: (_) => ResetPasswordProvider()),
          ChangeNotifierProvider<FamilySignsProvider>(
              create: (_) => FamilySignsProvider()),
          ChangeNotifierProvider<AlphabetProvider>(
              create: (_) => AlphabetProvider()),
          ChangeNotifierProvider<GameOneProvider>(
              create: (_) => GameOneProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dictionary App',
          theme: ThemeData(
            fontFamily: "voltage",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: const LandingPage(),
        ));
  }
}
