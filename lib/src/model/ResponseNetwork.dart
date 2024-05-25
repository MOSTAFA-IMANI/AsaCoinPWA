class ResponseNetwork<T> {
  final T _data;
  final bool _isSuccess;

  ResponseNetwork(this._data, this._isSuccess);

  bool get isSuccess => _isSuccess;

  T get data => _data;
}
