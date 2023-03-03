import 'package:flutter/material.dart';
import 'package:jobsapp/models/job_model.dart';
import 'package:jobsapp/providers/job_provider.dart';
import 'package:jobsapp/widget/headerSecPage.dart';
import 'package:jobsapp/widget/job_post.dart';
import 'package:provider/provider.dart';

class SecHomePage extends StatelessWidget {
  const SecHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String title = args['title'] as String;
    final String image = args['image'] as String;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              HeaderSecPage(image: image, title: title),
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
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobs(),
                        builder: (
                          context,
                          snapshot,
                        ) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: snapshot.data!
                                  .map((job) => JobPost(
                                     job))
                                  .toList(),
                            );
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                      )
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
