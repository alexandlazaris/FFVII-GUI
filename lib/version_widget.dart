import 'dart:async';
import 'package:ffvii_app/widgets/general/flexible_generic_window_.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class VersionWidget extends StatefulWidget {
  const VersionWidget({super.key});

  @override
  State<VersionWidget> createState() => _VersionWidgetState();
}

class _VersionWidgetState extends State<VersionWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String version = _packageInfo.version;
    final String build = _packageInfo.buildNumber;

    return FlexibleGenericWindow(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 24, fontFamily: "Reactor7"),
              children: [
                const TextSpan(
                  text:
                      'Thank you for exploring ffvii_app.\n Please raise any issues or requests ',
                ),
                TextSpan(
                  text: 'here.',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 24,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = _openLink, // 👈 connect here
                ),
              ],
            ),
          ),

          Text("v$version + $build", style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

Future<void> _openLink() async {
  final uri = Uri.parse('https://github.com/alexandlazaris/FFVII-GUI/issues');

  final success = await launchUrl(uri, mode: LaunchMode.externalApplication);

  if (!success) {
    // optional error handling
    print('Could not launch $uri');
  }
}
