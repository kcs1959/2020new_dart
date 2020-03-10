import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:kcs_2020_shinkan_web/wid/eventTile.dart';
import 'ext/hover_extensions.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

const TextStyle h1 = TextStyle(
  color: Colors.black87,
  fontSize: 100.0,
);

const TextStyle titleDescription = TextStyle(
    color: Colors.black87,
    fontSize: 30.0
);

const TextStyle titleBlack = TextStyle(
    backgroundColor: Colors.black87,
    color: Colors.white
);

const List<String> carouselImages = [
  "image/carousel1.jpg",
  "image/carousel2.jpg",
  "image/carousel3.jpg",
  "image/carousel4.jpg",
  "image/carousel5.jpg",
  "image/carousel6.jpg",
  "image/carousel7.jpg",
  "image/carousel8.jpg",
  "image/carousel9.jpg",
];

class cskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "CS.K",
            style: TextStyle(color: Colors.black87),
          ).showCursorOnHover,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            FlatButton(
              hoverColor: Colors.transparent,
              onPressed: () { },
              child: Text("About CS.K").showCursorOnHover.moveUpOnHover,
            ).showCursorOnHover.moveUpOnHover,
            FlatButton(
              hoverColor: Colors.transparent,
              onPressed: () { },
              child: Text("Works-2019").showCursorOnHover.moveUpOnHover,
            ).showCursorOnHover.moveUpOnHover,
            FlatButton(
              hoverColor: Colors.transparent,
              onPressed: () { },
              child: Text("Information").showCursorOnHover.moveUpOnHover,
            ).showCursorOnHover.moveUpOnHover,
            FlatButton(
              hoverColor: Colors.transparent,
              onPressed: () { },
              child: Text("Schedule").showCursorOnHover.moveUpOnHover,
            ).showCursorOnHover.moveUpOnHover,
            FlatButton(
              hoverColor: Colors.transparent,
              onPressed: () { },
              child: Text("FAQ"),
            ).showCursorOnHover.moveUpOnHover,
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Opacity(
                            opacity: 0.5,
                            child: Image.asset("image/kcsdragon.png", fit: BoxFit.fitHeight)
                        )
                    ),
                    Positioned(
                      top: 50.0,
                      left: 10.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            width: 10.0,
                            height: 380.0,
                            color: Colors.black87,
                          ),
                          Text(
                            "CS.K2020\n新歓特設\nサイト",
                            style: TextStyle(fontSize: 100, color: Colors.black87),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        "What is CS.K?",
                        style: TextStyle(fontSize: 100.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        "CS.Kは慶應最大のコンピュータサークルです！",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    Image.asset("image/uzuka.jpg",),
                    Text(
                        "電子計算機研究会 通称:CS.Kは、低能未熟大学最大の限界サークルです。\n\n"
                            + "サークル設立は1959年、会員数は2020年2月時点で60人以上。理工学部の学生のみならず、経済学部B方式やSFC学部など、多様な学部の学生が所属しています。\n\n"
                            + "部員は『Web研究会』・『AI研究会』・『DTM研究会』・『Blender研究会』・『Unity研究会』の5つの研究会に所属して、創作活動に日々取り組んでいます。"
                    ),
                    groupIntroduction("Web研究会", "あああああああああああああああああああああああああああああああああ"),
                    groupIntroduction("AI研究会", "あああああああああああああああああああああああああああああああああ"),
                    groupIntroduction("DTM研究会", "あああああああああああああああああああああああああああああああああ"),
                    groupIntroduction("Blender研究会", "あああああああああああああああああああああああああああああああああ"),
                    groupIntroduction("Unity研究会", "あああああああああああああああああああああああああああああああああ"),
                  ],
                ),
              ),
              Container(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: Text("Works-2019", style: h1,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 64.0),
                        child: Text("CS.Kで2019年に制作されたなにかの一覧です。", style: TextStyle(fontSize: 20.0),),
                      ),
                      Center(
                        child: CarouselSlider(
                          height: 450.0,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          aspectRatio: 4/3,
                          items: carouselImages.map((img) {
                            return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                                      decoration: BoxDecoration(color: Colors.transparent),
                                      child: Image.asset(img)
                                  );
                                }
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Information", style: h1,),
                    Text("新歓ブース情報", style: TextStyle(fontSize: 30.0),),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        var size = new Size(constraints.maxWidth, constraints.maxHeight);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 64.0),
                          child: new Row(
                            children: <Widget>[
                              SizedBox(
                                width: size.width/2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Hiyoshi-Camupus", style: TextStyle(backgroundColor: Colors.black87, color: Colors.white),),
                                    Text("日吉キャンパス塾生会館213号室", style: TextStyle(fontSize: 30.0),),
                                    Text("Date", style: TextStyle(backgroundColor: Colors.black87, color: Colors.white),),
                                    Text("3/32(日)-3/35(水) 4:00-13:00", style: TextStyle(fontSize: 30.0),),
                                    Text(
                                        "CS.Wの現役部員がサークルの紹介を行います。\n"
                                            + "サークルに関する質問もお気軽にどうぞ！ブースではパンフレットに加え、Orfevreが制作したBeyond the Limitも無料で配布致します！"
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width/2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.network("http://www.hc.keio.ac.jp/ja/hiyoshi_campus/guide/9esamb0000009q1g-img/9esamb000000a4f1.gif")
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Schedule", style: h1,),
                    Text("新歓期活動予定", style: titleDescription,),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        var size = new Size(constraints.maxWidth, constraints.maxHeight);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 64.0),
                          child: new Row(
                            children: <Widget>[
                              SizedBox(
                                width: size.width/2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Place/Time", style: TextStyle(backgroundColor: Colors.black87, color: Colors.white),),
                                    Text("日吉キャンパス塾生会館213号室", style: TextStyle(fontSize: 30.0),),
                                    Text("毎週水曜・金曜 4:00-13:00", style: TextStyle(fontSize: 30.0),),
                                    Text(
                                        "活動を行う教室は日程によって異なる場合があります！活動の前にCS.K公式ツイッターで最新の情報をご確認ください！"
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width/2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    calendar()
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(),
                    Text("Event", style: titleBlack,),
                    Text("新入生向けイベント・講座予定", style: titleDescription,),
                    eventTile(title: "Unity講習会", date:"Unity班", description: "ああああああああああああああああああ\nああああああああああああああ", bgColor: Colors.blue),
                    eventTile(title:"PRMLよむよむ",date: "AI班", description: "ああああああああああああああああああ\nああああああああああああああ", bgColor: Colors.green),
                    eventTile(title:"Flutter",date: "Web班", description: "ああああああああああああああああああ\nああああああああああああああ", bgColor: Colors.red),
                    Divider(),
                    Text("Compa", style: titleBlack,),
                    Text("新歓コンパ情報", style: titleDescription,),
                    Row(
                      children: <Widget>[
                        Text("4/19(金)活動後20:15~ 銀屋 \n 4/24(水)活動後20:15~ 銀屋", style: titleDescription,),
                        Container(width: 64.0,),
                        Column(
                          children: <Widget>[
                            Text("Fee (New Student)", style: titleBlack,),
                            Text("新入生: 10000円", style: TextStyle(fontSize: 40.0),)
                          ],
                        )
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("FAQ", style: h1,),
                    Text("よくある質問", style: titleDescription,),
                    eventTile(
                        date: "Q.プログラミングもイラストも作曲も未経験なんですが入れますか？\n\n " +
                            "A.大丈夫です！毎年新入生のほとんどは初心者です。サークルに入れば先輩たちが丁寧に教えます！",
                        bgColor: Colors.black87),
                    eventTile(
                        date: "Q.女子だから入りづらい…\n\n " +
                            "A.大丈夫です！サークルには女子会員も多く所属しています。みす女子会も開かれたりなどアクティブに活動しています！",
                        bgColor: Colors.black87),
                    eventTile(
                        date: "Q.文系でも大丈夫ですか？\n\n " +
                            "A.問題ありません！文系は勿論2年生以上から所属した人やインカレ生もいます！留学生もいますよ！（但し、インカレ生は早稲田大学の学生とは異なる事務手続きを行う必要があります。入会希望の場合はその旨お伝えください。）",
                        bgColor: Colors.black87),
                    eventTile(
                        date: "Q.活動には毎回参加しないといけませんか？\n\n " +
                            "A.そんなことはないです！週一でも月一でもお好きなペースで活動できます！",
                        bgColor: Colors.black87),
                    eventTile(
                        date: "Q.ゲームは普段あまりしないけど創作活動がしたいです！\n\n " +
                            "A.いいと思います！ゲーム制作以外の早稲田祭企画・活動もたくさんやってます。自分で企画を立てるのも良いかもしれません！",
                        bgColor: Colors.black87),
                    eventTile(
                        date: "Q.活動に必要な物はありますか？\n\n " +
                            "A.特にありませんが、パソコンやタブレットなどを持っていくと活動を体験できて良いかもしれません！",
                        bgColor: Colors.black87),
                  ],
                ),
              ),
              Container(
                color: Colors.black12,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var size = new Size(constraints.maxWidth, constraints.maxHeight);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64.0),
                      child: new Row(
                        children: <Widget>[
                          SizedBox(
                              width: size.width/3*2,
                              child: Center(
                                child: Text(
                                  "最新の情報は、\n"
                                      + "CS.K公式サイト\n"
                                      + "公式ツイッターを\n"
                                      + "チェック！",
                                  style: TextStyle(fontSize: 50.0),
                                ),
                              )
                          ),
                          SizedBox(
                            width: size.width/3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Links", style: titleBlack,),
                                Text("CS.K公式サイト", style: TextStyle(fontSize: 30.0),),
                                Text("CS.K公式ツイッター", style: TextStyle(fontSize: 30.0),),
                                Text("Credit", style: titleBlack,),
                                Text("Web Site Design: Fastriver"),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}

Widget groupIntroduction(String title, String description) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 30.0),),
        Text(description, style: TextStyle(fontSize: 20.0),),
        Divider(color: Colors.black87,)
      ],
    ),
  );
}

List<DateTime> shinkanDates = [
  DateTime(2020, 04, 02),
  DateTime(2020, 04, 03),
  DateTime(2020, 04, 04),
  DateTime(2020, 04, 05),
  DateTime(2020, 04, 06),
  DateTime(2020, 04, 07),
  DateTime(2020, 04, 08),
  DateTime(2020, 04, 09),
  DateTime(2020, 04, 10),
  DateTime(2020, 04, 11),
];

Widget shinkanIcon(String day) => Container(
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.all(
        Radius.circular(1000)
    ),
  ),
  child: Center(
    child: Text(
      day,
      style: TextStyle(
          color: Colors.black87
      ),
    ),
  ),
);

Widget calendar() {
  var dateMap = new EventList<Event>(
    events: {},
  );

  shinkanDates.forEach((d) {
    dateMap.add(d, new Event(
        date: d,
        title: "Event 5",
        icon: shinkanIcon(d.day.toString())
    ));
  });

  return CalendarCarousel(
    height: 400.0,
    markedDatesMap: dateMap,
    markedDateShowIcon: true,
    markedDateIconMaxShown: 1,
    markedDateMoreShowTotal: null,
    markedDateIconBuilder: (e) => e.icon,
  );
}
