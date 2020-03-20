import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/SchedulePage/scheduleLayout.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class ScheduleContentView extends StatefulWidget {
  final DeviceInfo deviceInfo;

  ScheduleContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleContentViewState();
}

class _ScheduleContentViewState extends State<ScheduleContentView> {
  PageController pageViewController;
  bool isPrevButtonEnabled;
  bool isNextButtonEnabled;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController(
      initialPage: 0
    );
    isPrevButtonEnabled = false;
    isNextButtonEnabled = true;
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AutoSizeText(
                  "Computer Society\n年間行事 2019",
                  textAlign: TextAlign.center,
                  style: BaseTextStyles.h1Tint(widget.deviceInfo, tint: Color(0xFF1A237E)),
                ).safeText(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      pageViewController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut);
                    });
                  },
                  iconSize: 72.0,
                  color: Color(0xFF1A237E),
                  icon: Icon(Icons.trending_flat),
                  tooltip: "Swipe to Continue",
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 44.0),
              child: Container(
                width: 100,
                height: 12,
                color: Color(0xFF3F51B5),
              ),
            ),
          )
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "4月",
        title: "技術書展",
        content: "技術書展では様々な種類の技術書を販売することができます。\nKCSは、自分たちの興味ある技術や学んだことなどについてまとめた同人誌を販売しました。",
        images: [
          Image.asset("image/schedule/gijutsushoten.jpg")
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "4月",
        title: "M3(4月/10月)",
        content: "DTM班では、夏季休暇中に共通のテーマを決めて作曲し、CDを作って音楽のコミケ「M3」で売っています。",
        images: [
          Image.asset("image/schedule/m3.jpg")
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "5月",
        title: "新歓合宿",
        content: "湯河原温泉にて1泊2日の合宿をしました。\n卓球やカラオケ、足湯などレクリエーションを通じて新入生との親睦を深めました。",
        images: [
          //Image.asset("image/schedule/spring_camp1.jpg"),
          Image.asset("image/schedule/spring_camp2.jpg"),
          Image.asset("image/schedule/spring_camp3.jpg"),
          Image.asset("image/schedule/spring_camp4.jpg")
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "7月",
        title: "花火大会",
        content: "期末テスト前 最後の息抜きに横浜・山下公園で花火を見ました。その後みんなでタピオカ飲んで大学生しました！",
        images: [
          Image.asset("image/schedule/fire1.jpg"),
          Image.asset("image/schedule/fire2.jpg"),
          Image.asset("image/schedule/fire3.jpg"),
          Image.asset("image/schedule/fire4.jpg"),
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "9月",
        title: "開発合宿",
        content: "千葉県 土善旅館で開発合宿をしました。\n開発している人もいれば勉強している人もおり、何でもありです。みんなで花火もしました！",
        images: [
          Image.asset("image/schedule/summer_camp1.jpg"),
          Image.asset("image/schedule/summer_camp2.jpg"),
          Image.asset("image/schedule/summer_camp3.jpg"),
          Image.asset("image/schedule/summer_camp4.jpg"),
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "10月",
        title: "矢上祭",
        content: "昨年は台風の影響で中止になったため開発したものの進捗報告会をしました。",
        images: [
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "11月",
        title: "三田祭",
        content: "三田キャンパスでゲームや音楽・VR体験を行いました！\n4日間と長いので徹夜開発でアップデートも...?? いえ、楽しみましょう！",
        images: [
          Image.asset("image/schedule/mita1.jpg"),
          Image.asset("image/schedule/mita2.jpg"),
          Image.asset("image/schedule/mita3.jpg"),
          Image.asset("image/schedule/mita4.jpg"),
        ],
      ),
      ScheduleLayout(
        deviceInfo: widget.deviceInfo,
        topText: "12月",
        title: "有志クリスマス",
        content: "クリスマスの日に1年生の有志主導で集まり、部室にシュークリームタワーを建造しました。\n中々に映える出来です！",
        images: [
          Image.asset("image/schedule/christmas.jpg"),
        ],
      ),
    ];

    return Container(
      width: widget.deviceInfo.size.width,
      height:  widget.deviceInfo.size.height - 60,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageView(
              controller: pageViewController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  isPrevButtonEnabled = index != 0;
                  isNextButtonEnabled = index != pages.length - 1;
                });
              },
              children: pages
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: AnimatedContainer(
                width: isNextButtonEnabled ? 96: 0,
                height: isNextButtonEnabled ? 48: 0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Color(0xFF3F51B5),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: InkWell(
                  onTap: () {
                    var currentPage = (pageViewController.page + 0.5).floor();
                    if(currentPage + 1 >= pages.length) return;
                    pageViewController.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("NEXT", style: BaseTextStyles.button,).safeText(),
                        Icon(Icons.chevron_right, color: Colors.white60,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: AnimatedContainer(
                width: isPrevButtonEnabled ? 96: 0,
                height: isPrevButtonEnabled ? 48: 0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  color: Color(0xFF3F51B5),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: InkWell(
                  onTap: () {
                    var currentPage = (pageViewController.page + 0.5).floor();
                    if(currentPage < 1) return;
                    pageViewController.animateToPage(
                      currentPage - 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.chevron_left, color: Colors.white60,),
                        Text("PREV", style: BaseTextStyles.button,).safeText(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}