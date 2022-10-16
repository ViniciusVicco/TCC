class DialogAction<T> {
  T child;
  void Function() onPressed;

  DialogAction({required this.child, required this.onPressed});
}
