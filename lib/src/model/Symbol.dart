import 'dart:ffi';

class Symbol {
  final String _logo;
  final String _name;
  final double _price;
  final double _changeRate;

  Symbol(this._logo, this._name, this._price, this._changeRate);

  double get changeRate => _changeRate;

  double get price => _price;

  String get name => _name;

  String get logo => "https://asacoine.com/$_logo";
}
