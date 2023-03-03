// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:jobsapp/config/appaset.dart';
import 'package:jobsapp/config/appcolor.dart';
import 'package:jobsapp/models/job_model.dart';
import 'package:jobsapp/widget/textButton.dart';
import 'package:jobsapp/widget/textButtonApplied.dart';

// ignore: must_be_immutable
class DetailsJob extends StatefulWidget {
  late final JobModel job;
  DetailsJob({super.key, required this.job});

  bool isApplied = false;

  @override
  State<DetailsJob> createState() => _DetailsJobState();
}

class _DetailsJobState extends State<DetailsJob> {
  Widget JobDesc(String note) {
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
        Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              note,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColor.blackColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }

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
                      Image.network(
                        widget.job.companyLogo!,
                        height: 60,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.job.name!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${widget.job.companyName} - ${widget.job.location}',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              JobTitle(context, 'About the Job'),
                              Column(
                                children: widget.job.about
                                    .map((note) => JobDesc(note))
                                    .toList(),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          JobTitle(context, 'Qualifications'),
                          Column(
                            children: widget.job.qualifications
                                .map((note) => SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: JobDesc(note)))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          JobTitle(context, 'Responsibilities'),
                          Column(
                            children: widget.job.responsibilities
                                .map((note) => SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: JobDesc(note)))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 16,
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
