import 'package:flutter/material.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/models/job_model.dart';

class JobPost extends StatelessWidget {
  final JobModel job;
  
  const JobPost(this.job, {super.key});

  // const JobPost(
  //     {super.key,
  //     required this.title,
  //     required this.image,
  //     required this.subTitle});
  // final String title;
  // final String subTitle;
  // final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              job.companyLogo!,
              height: 45,
            ),
            const SizedBox(
              width: 27,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name!,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  job.companyName!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 18.5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.73,
            height: 1,
            color: AppColor.lineColor,
          ),
        )
      ],
    );
  }
}
