import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/pages/menu/home-page.dart';
import 'package:personal_app/pages/onBoarding/about-us.dart';
import 'package:personal_app/pages/onBoarding/onBoarding.dart';
import 'package:personal_app/pages/sign-in/forgot-password/congratulations-password.dart';
import 'package:personal_app/pages/sign-in/forgot-password/forgot-password.dart';
import 'package:personal_app/pages/sign-in/forgot-password/update-password.dart';
import 'package:personal_app/pages/sign-in/login-home.dart';
import 'package:personal_app/pages/sing-up/info-pessoais.dart';
import 'package:personal_app/pages/sing-up/signup.dart';

import 'firebase_options.dart';
import 'pages/sing-up/info-contatos.dart';
import 'pages/sing-up/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/onboarding': (context) => const OnBoarding(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/signup': (context) => const Signup(),
        '/update-password': (context) => const UpdatePassword(),
        '/sucess-password': (context) => const CongratulationsPassword(),
        '/preferences': (context) => const Preferences(),
        '/aboutus': (context) => const AboutUs(),
        '/home-page': (context) => const HomePage(),
        '/info-contatos': (context) => const InfoContatos(),
        '/info-pessoais': (context) => const InfoPessoais()
      },
    ),
  );
}
