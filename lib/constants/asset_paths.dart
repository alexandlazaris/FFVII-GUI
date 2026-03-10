class AssetPaths {
  static const String _package = 'ffvii_app';
  static String _getAssetPath(String assetName) {
    const String appName = String.fromEnvironment(
      'APP_NAME',
      defaultValue: 'main',
    );
    // When running in widgetbook (separate app), use packages/ prefix
    if (appName == 'widgetbook_ffvii') {
      return 'packages/$_package/assets/$assetName';
    }
    // When running in main app, use direct path
    return 'assets/$assetName';
  }

  static String profileForCharacter(String characterName) {
    final sanitizedName = characterName.toLowerCase().trim().replaceAll(
      RegExp(r'\s+'),
      '-',
    );
    return _getAssetPath('profile-$sanitizedName.jpg');
  }

  static String get startSwordLarge => _getAssetPath('start-sword-large.png');
  static String get profileEmpty => _getAssetPath('profile-empty.png');
  static String get cursorLarge => _getAssetPath('cursor-large.png');
}
