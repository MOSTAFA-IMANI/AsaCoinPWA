import 'dart:ffi';

import 'package:asacoine/src/urls.dart';

class Symbol {
  final String _logo;
  final String _name;
  final double _price;
  final double _changeRate;

  Symbol(this._logo, this._name, this._price, this._changeRate);

  double get changeRate => _changeRate;

  double get price => _price;

  String get name => _name;

  String get logo => AppUrls.baseUrl + _logo;
}
