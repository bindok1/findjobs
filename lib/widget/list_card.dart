import 'package:flutter/material.dart';
import 'package:jobsapp/config/approute.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.secHomePage,arguments: {'title':title,'image': image}
        );
      },
      child: Container(
        height: 200,
        width: 150,
        decoration:
            BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16, right: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
