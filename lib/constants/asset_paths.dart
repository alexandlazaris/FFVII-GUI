import 'package:package_info_plus/package_info_plus.dart';

class AppEnvironment {
  static bool isWidgetbook = false;
}

class AssetPaths {
  static String? _appName;

  static Future<void> init() async {
    final info = await PackageInfo.fromPlatform();
    _appName = info.appName;
  }

  static String get appName => _appName ?? 'Unknown';

  static String _getAssetPath(String assetName) {
    if (AppEnvironment.isWidgetbook == true) {
      print('using widgetbook assets');
      return 'packages/ffvii_app/assets/$assetName';
    } else {
      // TODO: this logic is forcing all non-widgetbook assets to sit underneath assets/, it overrides the use of specific folders. Need to resolve this
      return 'assets/$assetName';
    }
  }

  static String profileForCharacter(String characterName) {
    final sanitizedName = characterName.toLowerCase().trim().replaceAll(
      RegExp(r'\s+'),
      '-',
    );
    print('sanitized asset name is: $sanitizedName');
    return _getAssetPath('profile-$sanitizedName.jpg');
  }

  static String get startSwordLarge => _getAssetPath('start-sword-large.png');
  static String get profileEmpty => _getAssetPath('profile-empty.png');
  static String get cursorLarge => _getAssetPath('cursor-large.png');
}
