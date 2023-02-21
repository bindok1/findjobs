// ignore: file_names
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobsapp/config/appcolor.dart';

class TextPage extends StatefulWidget {
  const TextPage(
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
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController controller = TextEditingController(text: '');
  bool? isEmailValid;
  bool obsecuretext = false;
  bool sufficIcon = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '');
    isEmailValid = null;
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
            obscureText: widget.obsecureText,
            controller: widget.controller,
            onChanged: (value) {
              print(value);
              bool isValid = EmailValidator.validate(value);
              print(isValid);
              setState(() {
                isEmailValid = isValid;
              });
              if (isValid) {
                setState(() {
                  isEmailValid = true;
                });
              } else {
                setState(() {
                  isEmailValid = false;
                });
              }
            },
            decoration: InputDecoration(
                suffixIcon: widget.sufficIcon
                    ? IconButton(
                        icon: obsecuretext == false
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
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
                    borderSide: BorderSide(
                      color: isEmailValid == true
                          ? AppColor.primary
                          : isEmailValid == false
                              ? AppColor.redColor
                              : AppColor.textColor,
                      style: BorderStyle.solid,
                    ))),
            style: TextStyle(
                color: isEmailValid == false
                    ? AppColor.redColor
                    : AppColor.primary),
          ),
        ],
      ),
    );
  }
}
