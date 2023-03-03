import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsapp/config/approute.dart';

import 'package:jobsapp/page/home_page.dart';
import 'package:jobsapp/page/secondhome_page.dart';

import 'package:jobsapp/page/sign_up_page.dart';
import 'package:jobsapp/page/splash_page.dart';
import 'package:jobsapp/page/sign_in.dart';
import 'package:jobsapp/providers/auth_providers.dart';
import 'package:jobsapp/providers/category_provider.dart';
import 'package:jobsapp/providers/job_provider.dart';
import 'package:jobsapp/providers/user_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<JobProvider>(create: (context) => JobProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        routes: {
          '/': (context) => const SplashPage(),
          AppRoute.splashPage: (context) => const SplashPage(),
          AppRoute.homePage: (context) => const StartedPage(),
          AppRoute.signUpPage: (context) => const SignUp(),
          AppRoute.startedPage: (context) => const StartedPage(),
          AppRoute.primaryMenu: (context) => const PrimaryMenu(),
          AppRoute.secHomePage: (context) => const SecHomePage(),

        },
      ),
    );
  }
}
