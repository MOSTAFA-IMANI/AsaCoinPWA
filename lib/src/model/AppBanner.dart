class AppBanner {
  final String _imageUrl;
  final String _contentDescription;
  final String _deepLink;
  final bool _isInternalLink;

  AppBanner(this._imageUrl, this._contentDescription, this._deepLink,
      this._isInternalLink);

  bool get isInternalLink => _isInternalLink;

  String get deepLink => _deepLink;

  String get contentDescription => _contentDescription;

  String get imageUrl => _imageUrl;

  factory AppBanner.fromJson(Map<String, dynamic> json) {
    return AppBanner(
      json['image_url'],
      json['content_description'],
      json['deep_link'],
      json['is_internal_link'],
    );
  }
}
