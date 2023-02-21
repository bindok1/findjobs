import 'package:flutter/material.dart';
import 'package:jobsapp/config/appcolor.dart';

class CustomForm extends StatefulWidget {
  const CustomForm(
      {super.key,
      required this.textName,
      this.sufficIcon = false,
      this.obsecureText = false,
      required this.controller});
  final bool obsecureText;
  final TextEditingController controller;
  final String textName;
  final bool sufficIcon;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  TextEditingController controller = TextEditingController(text: '');
  bool? isEmailValid;
  bool obsecuretext = false;
  bool sufficIcon = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '');
    isEmailValid = null;
    obsecuretext = true;
  }

  @override
  Widget build(BuildContext context) {
    widget.sufficIcon;
    widget.controller;

    widget.obsecureText;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.greyColor),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
              obscureText: obsecuretext,
              controller: widget.controller,
              decoration: InputDecoration(
                suffixIcon: widget.sufficIcon
                    ? IconButton(
                        icon: obsecuretext == false
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            obsecuretext = !obsecuretext;
                          });
                        },
                      )
                    : const SizedBox(),
                fillColor: AppColor.textColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: AppColor.primary)),
              ))
        ],
      ),
    );
  }
}
