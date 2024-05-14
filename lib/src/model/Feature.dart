class Feature {
  final String _icon;
  final String _name;
  final String _link;
  final bool _isInternalLink;

  Feature(this._icon, this._name, this._link, this._isInternalLink);

  String get name => _name;

  String get icon => _icon;

  bool get isInternalLink => _isInternalLink;

  String get link => _link;
}
