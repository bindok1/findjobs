import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/config/approute.dart';
import 'package:jobsapp/widget/job_post.dart';
import 'package:jobsapp/widget/list_card.dart';

class PrimaryMenu extends StatelessWidget {
  const PrimaryMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text('Jason Powell',
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
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.color),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.secHomePage,
                        arguments: {
                          'image': AppAsset.card_1,
                          'title': 'Web\nDeveloper'
                        });
                  },
                  child: const ListCard(
                    title: 'Web\nDeveloper',
                    image: AppAsset.card_1,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.secHomePage,
                        arguments: {
                          'image': AppAsset.card_2,
                          'title': 'App\nDeveloper'
                        });
                  },
                  child: const ListCard(
                    title: 'App\nDeveloper',
                    image: AppAsset.card_2,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.secHomePage,
                        arguments: {
                          'image': AppAsset.card_3,
                          'title': 'Content\nWriter'
                        });
                  },
                  child: const ListCard(
                    title: 'Content\nWriter',
                    image: AppAsset.card_3,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.secHomePage,
                        arguments: {
                          'image': AppAsset.card_4,
                          'title': 'Video\nGrapher'
                        });
                  },
                  child: const ListCard(
                    title: 'Video\nGrapher',
                    image: AppAsset.card_4,
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
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
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.detailsJob);
                },
                child: const JobPost(
                    title: 'Front-End Developer',
                    image: AppAsset.googleImage,
                    subTitle: 'Google'),
              ),
              const SizedBox(
                height: 16 + 16,
              ),
              const JobPost(
                  title: 'Ui Designer',
                  image: AppAsset.igImage,
                  subTitle: 'Instragram'),
              const SizedBox(
                height: 32,
              ),
              const JobPost(
                  title: 'Data Scientist',
                  image: AppAsset.fbImage,
                  subTitle: 'Facebook'),
            ],
          )
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
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              header(),
              const SizedBox(
                height: 30,
              ),
              body()
            ]),
          ),
        ],
      )),
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
