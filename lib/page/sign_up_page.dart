import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/config/approute.dart';
import 'package:jobsapp/models/user_models.dart';
import 'package:jobsapp/providers/auth_providers.dart';
import 'package:jobsapp/providers/user_providers.dart';
import 'package:provider/provider.dart';

import '../widget/textButton.dart';
import '../widget/textcustomform.dart';
import '../widget/textformpage_email .dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      isUploaded
                          ? picImage(context, AppAsset.userPic)
                          : picImage(context, AppAsset.uploadPic),
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
                        obsecureText: false,
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
                                label: 'Sign Up',
                                isExpand: true,
                                press: () async {
                                  if (nameController.text.isEmpty ||
                                      emailController.text.isEmpty ||
                                      goalController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    showError('Harap isi semua field');
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    UserModel? user =
                                        await authProvider.register(
                                      emailController.text,
                                      passwordController.text,
                                      nameController.text,
                                      goalController.text,
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
                                }),
                      ),
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
    );
  }

  Center picImage(BuildContext context, String imagePic) {
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
