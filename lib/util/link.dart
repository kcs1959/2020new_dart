import 'package:url_launcher/url_launcher.dart';

const String _TWITTER_KCS = "https://twitter.com/kcs1959";
const String _TWITTER_FASTRIVER = "https://twitter.com/fastriver_org";
const String _TWITTER_ORFEVRE = "https://twitter.com/ChevalGrand_y_h";

const String _GITHUB_KCS = "https://github.com/kcs1959";
const String _HP_KCS = "https://kcs1959.jp/";
const String _LINE_KCS = "https://lin.ee/AVumbCs";
const String _PEING_KCS = "https://peing.net/ja/kcs1959?event=0";
const String _MAIL_KCS = "mailto:kcs1959@gmail.com";
const String _SESSIONS_KCS = "https://kcs1959.jp/2020%E5%B9%B4%E5%BA%A6%E8%AC%9B%E7%BF%92%E4%BC%9A%E4%B8%80%E8%A6%A7";

const String _KCS_TUBER = "https://kcs1959.github.io/kcstuber/";

const String _SHARE_TWITTER = "https://twitter.com/intent/tweet?text=";
const String _SHARE_LINE = "https://social-plugins.line.me/lineit/share?url=";

const String _FORM_JA = "https://forms.gle/Tt2Sjj3GrByMHszeA";
const String _FORM_EN = "https://forms.gle/Fx8LVGVUWs5vmGhS8";

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

  static void toKCSTuber() async {
    await _hyperLink(_KCS_TUBER);
  }

  static void toSessionsKCS() async {
    await _hyperLink(_SESSIONS_KCS);
  }

  static void toFormJapanese() async {
    await _hyperLink(_FORM_JA);
  }

  static void toFormEnglish() async {
    await _hyperLink(_FORM_EN);
  }

  static void shareTwitter(String text) async {
    var encodedText = Uri.encodeComponent(text);
    var link = _SHARE_TWITTER + encodedText;
    await _hyperLink(link);
  }

  static void shareLINE(String text) async {
    var encodedText = Uri.encodeComponent(text);
    var link = _SHARE_LINE + encodedText;
    await _hyperLink(link);
  }

  static void shareFree(String url) async {
    await _hyperLink(url);
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