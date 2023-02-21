import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsapp/config/approute.dart';
import 'package:jobsapp/page/home_page.dart';
import 'package:jobsapp/page/secondhome_page.dart';
import 'package:jobsapp/page/sign_in_page.dart';
import 'package:jobsapp/page/sign_up_page.dart';
import 'package:jobsapp/page/splash_page.dart';
import 'package:jobsapp/page/started_page.dart';
import 'package:jobsapp/widget/details_job.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      routes: {
        '/': (context) => const SplashPage(),
        AppRoute.splashPage: (context) => const SplashPage(),
        AppRoute.homePage: (context) => const HomePage(),
        AppRoute.signUpPage: (context) => const SignUp(),
        AppRoute.startedPage: (context) => StartedPage(),
        AppRoute.primaryMenu: (context) => const PrimaryMenu(),
        AppRoute.secHomePage: (context) => const SecHomePage(),
        AppRoute.detailsJob:(context) => DetailsJob()
      },
    );
  }
}
