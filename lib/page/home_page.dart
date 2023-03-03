import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/models/category_models.dart';
import 'package:jobsapp/models/job_model.dart';
import 'package:jobsapp/providers/category_provider.dart';
import 'package:jobsapp/providers/job_provider.dart';
import 'package:jobsapp/providers/user_providers.dart';
import 'package:jobsapp/widget/details_job.dart';
import 'package:jobsapp/widget/job_post.dart';
import 'package:jobsapp/widget/list_card.dart';
import 'package:provider/provider.dart';

class PrimaryMenu extends StatelessWidget {
  const PrimaryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Howdy',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor)),
              Text(userProvider.user.name.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.blackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const Spacer(),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.circleColor, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.color),
                  child: Image.asset(
                    AppAsset.showPic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hot Categories',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.blackColor),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder<List<CategoryModel>>(
                future: categoryProvider.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    int index = -1;
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!.map((category) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? 16 : 0, right: 16),
                            child: ListCard(
                              title: category.name!,
                              image: category.imageUrl!,
                            ),
                          );
                        }).toList());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Just Posted',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColor.blackColor),
          ),
          const SizedBox(
            height: 25,
          ),
          FutureBuilder<List<JobModel>>(
            future: jobProvider.getJobs(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: snapshot.data!
                      .map((job) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsJob(job: job)));
                            },
                            child: JobPost(job),
                          ))
                      .toList(),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
          // Column(
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, AppRoute.detailsJob);
          //       },
          //       child: const JobPost(
          //           title: 'Front-End Developer',
          //           image: AppAsset.googleImage,
          //           subTitle: 'Google'),
          //     ),
          //     const SizedBox(
          //       height: 16 + 16,
          //     ),
          //     const JobPost(
          //         title: 'Ui Designer',
          //         image: AppAsset.igImage,
          //         subTitle: 'Instragram'),
          //     const SizedBox(
          //       height: 32,
          //     ),
          //     const JobPost(
          //         title: 'Data Scientist',
          //         image: AppAsset.fbImage,
          //         subTitle: 'Facebook'),
          //   ],
          // )
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: AppColor.greyColor,
          selectedItemColor: AppColor.primary,
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(
                  AppAsset.bottomBar_1,
                )),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(
                  AppAsset.bottomBar_2,
                )),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(
                  AppAsset.bottomBar_3,
                )),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(
                  AppAsset.bottomBar_4,
                )),
                label: '')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    const SizedBox(
                      height: 30,
                    ),
                    body()
                  ]),
            ),
          ],
        )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container CardList(BuildContext context, String title, String imageUrl) {
    return Container(
      height: 200,
      width: 150,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(imageUrl))),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
