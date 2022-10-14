import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String subTitle;
  final IconData leadingIcon;

  const DrawerMenuItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subTitle,
      required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            size: 40,
            color: Colors.blue,
          ),
          title: Text(title),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }
}
