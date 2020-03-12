import 'package:url_launcher/url_launcher.dart';

const String _TWITTER_KCS = "https://twitter.com/kcs1959";
const String _TWITTER_FASTRIVER = "https://twitter.com/fastriver_org";
const String _TWITTER_ORFEVRE = "https://twitter.com/ChevalGrand_y_h";

const String _GITHUB_KCS = "https://github.com/kcs1959";
const String _HP_KCS = "https://kcs1959.jp/";
const String _LINE_KCS = "https://lin.ee/AVumbCs";
const String _PEING_KCS = "https://peing.net/ja/kcs1959?event=0";
const String _MAIL_KCS = "mailto:kcs1959@gmail.com";

class Link {
  static void toTwitterKCS() async {
    await _hyperLink(_TWITTER_KCS);
  }

  static void toTwitterFastriver() async {
    await _hyperLink(_TWITTER_FASTRIVER);
  }

  static void toTwitterOrfevre() async {
    await _hyperLink(_TWITTER_ORFEVRE);
  }

  static void toGitHubKCS() async {
    await _hyperLink(_GITHUB_KCS);
  }

  static void toKCS1959() async {
    await _hyperLink(_HP_KCS);
  }

  static void toLineKCS() async {
    await _hyperLink(_LINE_KCS);
  }

  static void toShitsumonBakoKCS() async {
    await _hyperLink(_PEING_KCS);
  }

  static void toMailKCS() async {
    await _hyperLink(_MAIL_KCS);
  }

  static Future<bool> _hyperLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    } else {
      return false;
    }
  }
}