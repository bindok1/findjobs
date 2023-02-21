// ignore: file_names
import 'package:flutter/material.dart';

class HeaderSecPage extends StatelessWidget {
  const HeaderSecPage({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Expanded(
        child: Container(
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(16)),
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24, top: 178),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'available',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )
          ],
        ),
      ),
    ]);
  }
}
