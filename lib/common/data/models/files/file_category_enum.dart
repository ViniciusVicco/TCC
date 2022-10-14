enum FileCategory { profile }

extension FileCategoryExtension on FileCategory {
  String getStringPathFromCategory() {
    switch (this) {
      case FileCategory.profile:
        return "profile";
    }
  }
}
