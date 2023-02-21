import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/widget/headerSecPage.dart';
import 'package:jobsapp/widget/job_post.dart';

class SecHomePage extends StatelessWidget {
  const SecHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String? image = args?['image'].toString();
    final String? title = args?['title'].toString();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              HeaderSecPage(image: image!, title: title!),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big Companies',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const JobPost(
                        title: 'Front-End Developer',
                        image: AppAsset.googleImage,
                        subTitle: 'Google',
                      ),
                      const SizedBox(
                        height: 16.5,
                      ),
                      const JobPost(
                          title: 'UI Designer',
                          image: AppAsset.igImage,
                          subTitle: 'Instragram'),
                      const SizedBox(
                        height: 16.5,
                      ),
                      const JobPost(
                          title: 'Data Scientist',
                          image: AppAsset.fbImage,
                          subTitle: 'Facebook'),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'New Startups',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const JobPost(
                        title: 'Front-End Developer',
                        image: AppAsset.googleImage,
                        subTitle: 'Google',
                      ),
                      const SizedBox(
                        height: 16.5,
                      ),
                      const JobPost(
                          title: 'UI Designer',
                          image: AppAsset.igImage,
                          subTitle: 'Instragram'),
                      const SizedBox(
                        height: 16.5,
                      ),
                      const JobPost(
                          title: 'Data Scientist',
                          image: AppAsset.fbImage,
                          subTitle: 'Facebook'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
