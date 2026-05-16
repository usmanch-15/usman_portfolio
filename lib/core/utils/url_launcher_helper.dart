import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> sendEmail(String email,
      {String? subject, String? body}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> downloadCv() async {
    if (kIsWeb) {
      await openUrl('assets/cv/usman_cv.pdf');
    } else {
      await openUrl('assets/cv/usman_cv.pdf');
    }
  }
}