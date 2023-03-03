import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/config/approute.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAsset.iconBg,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                    child: Text(
                      'Build Your Next\nFuture Career Like\na Master',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    '18,000 jobs available',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 400 + 12,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66),
                            color: Colors.white),
                        child: Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoute.signUpPage);
                              },
                              child: Text(
                                'Get Started',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColor.primary),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66),
                            border: Border.all(color: Colors.white)),
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoute.startedPage);
                            },
                            child: Text(
                              'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
