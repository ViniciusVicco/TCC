class DataSourceResponse<T> {
  late bool success;
  T data;
  DataSourceResponse({required this.data, required this.success});
}
