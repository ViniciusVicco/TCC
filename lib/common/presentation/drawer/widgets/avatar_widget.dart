import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTap;
  const AvatarWidget({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.transparent,
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: CircleAvatar(
            radius: 60,
            child: Icon(
              Icons.person,
              size: 60,
            )),
      ),
    );
  }
}
