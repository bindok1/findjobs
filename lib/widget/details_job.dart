import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/widget/textButton.dart';
import 'package:jobsapp/widget/textButtonApplied.dart';

class DetailsJob extends StatefulWidget {
  DetailsJob({super.key, this.isApplied = false});

  bool isApplied = false;

  @override
  State<DetailsJob> createState() => _DetailsJobState();
}

class _DetailsJobState extends State<DetailsJob> {
  Widget applied() {
    if (widget.isApplied) {
      return cancelButton();
    } else {
      return Center(
        child: ButtonCustom(
          label: 'Apply Now',
          press: () {
            setState(() {
              widget.isApplied = true;
            });
          },
          isExpand: false,
        ),
      );
    }
  }

  Widget detailsApplied() {
    return Container(
      width: 312,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(49), color: AppColor.lineColor),
      child: Center(
          child: Text(
        'You have applied this job and the\nrecruiter will contact you',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w400, color: AppColor.subTextColor),
      )),
    );
  }

  Widget cancelButton() {
    return AppliedButton(
        label: 'Cancel Apply',
        press: () {
          setState(() {
            widget.isApplied = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Column(
                    children: [
                      if (widget.isApplied) detailsApplied(),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        AppAsset.googleImage,
                        height: 60,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Front-End Developer',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Google, Inc • Jakarta',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14, color: AppColor.greyColor),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          JobTitle(context, 'About the Job'),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context, 'Full-Time On Site'),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context, 'Start at \$18,000 per month'),
                          const SizedBox(
                            height: 30,
                          ),
                          JobTitle(context, 'Qualifications'),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context,
                              "Candidate must possess at least a\nBachelor's Degree."),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context,
                              'Able to use Microsoft Office and Googl\nbased service.'),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context,
                              'Have an excellent time management,\ngood at organized and details'),
                          const SizedBox(
                            height: 30,
                          ),
                          JobTitle(context, 'Responsibilities'),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context,
                              'Initiate and promote any programs, events,\ntraining, or activities.'),
                          const SizedBox(
                            height: 16,
                          ),
                          JobDesc(context,
                              'Assessing and anticipating needs and\ncollaborate with Division.'),
                          const SizedBox(
                            height: 51,
                          ),
                          Center(child: applied()),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Message Recruiter',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.greyColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row JobDesc(
    BuildContext context,
    String note,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Image.asset(
            AppAsset.dot,
            height: 12,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          note,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColor.blackColor,
              ),
        ),
      ],
    );
  }

  Text JobTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.blackColor),
    );
  }
}
