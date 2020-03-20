import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:kcs_2020_shinkan_web/util/DeviceInfo.dart';
import 'package:kcs_2020_shinkan_web/util/WorkGenre.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:kcs_2020_shinkan_web/ext/hover_extensions.dart';
import 'package:kcs_2020_shinkan_web/ext/safeText.dart';

class MainWorksView extends StatefulWidget {
  final DeviceInfo deviceInfo;

  MainWorksView({Key key, this.deviceInfo}): super(key: key);

  @override
  State<StatefulWidget> createState() => _MainWorksViewState();
}

class _MainWorksViewState extends State<MainWorksView> {
  List<WorkInfo> pickedUp;

  @override
  void initState() {
    super.initState();

    pickedUp = WorksData.pickUp(3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: widget.deviceInfo.size.height * 4 / 3,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("2019年度作品集", style: BaseTextStyles.h1(widget.deviceInfo),).safeText(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: SelectableText(
                  "2019年度に部員が制作した作品たちです。一部は三田祭などで展示を行いました。",
                  style: BaseTextStyles.plain,
                ),
              ),
              ResponsiveGridRow(
                children: pickedUp.map((work) {
                  return ResponsiveGridCol(
                    sm: 12, md: 6, lg: 4,
                    child: widget.deviceInfo.device == Device.PC
                        ? workCard(work, context)
                        : workCardForMobile(work, context),
                  );
                }).toList(),
              ),
              RaisedButton(
                color: Color(0x1cffffff),
                onPressed: () {
                  Navigator.of(context).pushNamed("/works");
                },
                child: ListTile(
                    title: Text("全ての作品を見る", style: BaseTextStyles.button,),
                    trailing: Icon(Icons.call_made, color: Color(0x99ffffff),)
                ),
              ).showCursorOnHover
            ],
          ),
        ),
      ),
    );
  }

  Widget workCard(WorkInfo info, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0x17ffffff),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                "/works",
                arguments: NavigateWorksArgument(info.id.toString())
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(info.title, style: BaseTextStyles.h4,).safeText(),
                subtitle: Text(info.author ?? "", style: BaseTextStyles.subtitle1,).safeText(),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                children: info.genres.map((genre) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Chip(
                      backgroundColor: Color(0xFF121212),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          side: BorderSide(width: 1.0, color: Color(0xFFaaaaaa))
                        ),
                        label: Text(genre.getString(), style: BaseTextStyles.subtitle1,).safeText()
                    ),
                  );
                }).toList(),
              ),
              info.image.isEmpty
                  ? Container(
                      height: 200,
                      child: Center(child: Text("No Image", style: BaseTextStyles.plain,),),
                    )
                  : Image.asset(info.image[0], height: 200, width: double.infinity, fit: BoxFit.cover,)
            ],
          ),
        ),
      ).showCursorOnHover,
    );
  }

  Widget workCardForMobile(WorkInfo info, context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          color: Color(0x17ffffff),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  "/works",
                  arguments: NavigateWorksArgument(info.id.toString())
              );
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: AutoSizeText(info.title, style: BaseTextStyles.h4, textAlign: TextAlign.center,).safeText(),
                        subtitle: AutoSizeText(info.author ?? "", style: BaseTextStyles.subtitle1, textAlign: TextAlign.center,).safeText(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: info.genres.map((genre) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Chip(
                                backgroundColor: Color(0xFF121212),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                    side: BorderSide(width: 1.0, color: Color(0xFFaaaaaa))
                                ),
                                label: Text(genre.getString(), style: BaseTextStyles.subtitle1,).safeText()
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                AspectRatio(
                  aspectRatio: 4/1,
                    child: info.image.isEmpty
                        ? Center(child: Text("No Image", style: BaseTextStyles.plain,),)
                        : Image.asset(info.image[0], fit: BoxFit.fitWidth,)
                )
              ],
            ),
          ),
        ).showCursorOnHover,
      ),
    );
  }
}
