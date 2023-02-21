import 'package:flutter/material.dart';
import 'package:jobsapp/config/appcolor.dart';

class AppliedButton extends StatelessWidget {
  const AppliedButton(
      {super.key,
      required this.label,
      required this.press,
      this.isExpand = false});
  final String label;
  final Function press;
  final bool? isExpand;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: () => press(),
          child: Container(
            height: 45 + 12,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColor.redColor),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14 + 4,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor),
              ),
            ),
          )),
    );
  }
}
