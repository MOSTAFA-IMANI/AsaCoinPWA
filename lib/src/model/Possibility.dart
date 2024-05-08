class Possibility{
  final String _icon;
  final String _title;
  final String _description;

  Possibility(this._icon, this._title, this._description);

  String get description => _description;

  String get title => _title;

  String get icon => _icon;
}