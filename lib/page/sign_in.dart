import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/config/approute.dart';
import 'package:jobsapp/widget/textcustomform.dart';
import 'package:jobsapp/widget/textButton.dart';
import 'package:jobsapp/widget/textformpage_email%20.dart';
import 'package:jobsapp/providers/auth_providers.dart';
import 'package:jobsapp/providers/user_providers.dart';
import 'package:provider/provider.dart';

import '../models/user_models.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({super.key});

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.redColor,
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColor.greyColor),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Build Your Career',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      AppAsset.signInPic,
                      height: 240,
                      width: 262,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      TextPage(
                        textName: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomForm(
                        textName: 'Password',
                        controller: passwordController,
                        sufficIcon: true,
                        obsecureText: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ButtonCustom(
                                label: 'Sign In',
                                press: () async {
                                  {
                                    if (emailController.text.isEmpty ||
                                        passwordController.text.isEmpty) {
                                      showError('Harap isi semua field');
                                    } else {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      UserModel? user =
                                          await authProvider.login(
                                        emailController.text,
                                        passwordController.text,
                                      );

                                      setState(() {
                                        isLoading = false;
                                      });
                                      if (user == null) {
                                        showError('Email Sudah Terdaftar');
                                      } else {
                                        userProvider.user = user;
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            AppRoute.primaryMenu,
                                            (route) => false);
                                      }
                                    }
                                  }
                                },
                                isExpand: true,
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.signUpPage);
                        },
                        child: Text(
                          'Create New Account?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14 + 4,
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.greyColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
