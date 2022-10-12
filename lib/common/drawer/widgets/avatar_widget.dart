import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool canEdit;
  const AvatarWidget({super.key, required this.imageUrl, this.canEdit = false});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return GestureDetector(
        onTap: canEdit ? () {} : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CircleAvatar(
            radius: 60,
            child: Image.network(
              imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  if (loadingProgress.cumulativeBytesLoaded !=
                      loadingProgress.cumulativeBytesLoaded) {
                    return const CircularProgressIndicator();
                  }
                }
                return child;
              },
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: canEdit ? () {} : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
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
