import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/config/approute.dart';

import '../widget/textButton.dart';
import '../widget/textcustomform.dart';
import '../widget/textformpage_email .dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isUploaded = false;
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  final TextEditingController goalController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColor.greyColor),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Begin New Journey',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        isUploaded
                            ? PicImage(context, AppAsset.userPic)
                            : PicImage(context, AppAsset.uploadPic),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomForm(
                          textName: 'Full Name',
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                          height: 20,
                        ),
                        CustomForm(
                          textName: 'Your Goal',
                          controller: goalController,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonCustom(
                            label: 'Sign Up',
                            isExpand: true,
                            press: () {
                              Navigator.pushNamed(
                                  context, AppRoute.primaryMenu);
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.startedPage);
                          },
                          child: Center(
                            child: Text(
                              'Back to sign',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 14 + 4,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.greyColor),
                            ),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center PicImage(BuildContext context, String imagePic) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isUploaded = !isUploaded;
          });
        },
        child: Image.asset(
          imagePic,
          height: 120,
        ),
      ),
    );
  }
}
