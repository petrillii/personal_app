import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/pages/menu/home-page.dart';
import 'package:personal_app/pages/onBoarding/about-us.dart';
import 'package:personal_app/pages/onBoarding/onBoarding.dart';
import 'package:personal_app/pages/sign-in/forgot-password/congratulations-password.dart';
import 'package:personal_app/pages/sign-in/forgot-password/forgot-password.dart';
import 'package:personal_app/pages/sign-in/forgot-password/update-password.dart';
import 'package:personal_app/pages/sign-in/login-home.dart';
import 'package:personal_app/pages/sign-in/login.dart';
import 'package:personal_app/pages/sing-up/signup.dart';

import 'pages/sing-up/info-contatos.dart';
import 'pages/sing-up/preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginHome(),
        '/onboarding': (context) => const OnBoarding(),
        '/login': (context) => const Login(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/signup': (context) => const Signup(),
        '/update-password': (context) => const UpdatePassword(),
        '/sucess-password': (context) => const CongratulationsPassword(),
        '/preferences': (context) => const Preferences(),
        '/aboutus': (context) => const AboutUs(),
        '/home-page': (context) => const HomePage(),
        '/info-contatos': (context) => const InfoContatos(),
      },
    ),
  );
}