import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';

class ScheduleLayout extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final String topText;
  final String title;
  final String content;
  final List<Image> images;

  ScheduleLayout({
    Key key,
    @required this.deviceInfo,
    @required this.topText,
    @required this.title,
    @required this.content,
    @required this.images
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleLayoutState();
}

class _ScheduleLayoutState extends State<ScheduleLayout> {
  PageController _pageViewController;

  @override
  void initState() {
    super.initState();

    _pageViewController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          overBar(widget.topText),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  widget.title, style: BaseTextStyles.h1Tint(widget.deviceInfo, tint: Color(0xFF1A237E)),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.content,
                  style: BaseTextStyles.plainTint(tint:  Color(0xFF1A237E)),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  height: double.infinity,
                  minWidth: 12,
                  child: FlatButton(
                    onPressed: () {
                      var currentPage = (_pageViewController.page + 0.5).floor();
                      if(currentPage < 1) return;
                      _pageViewController.animateToPage(
                        currentPage - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut
                      );
                    },
                    child: Icon(Icons.chevron_left, color: Color(0xFF1A237E),),
                  ),
                ),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 4/3,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageViewController,
                      children: widget.images
                    ),
                  ),
                ),
                ButtonTheme(
                  height: double.infinity,
                  minWidth: 20,
                  child: FlatButton(
                    onPressed: () {
                      var currentPage = (_pageViewController.page + 0.5).floor();
                      if(currentPage >= widget.images.length) return;
                      _pageViewController.animateToPage(
                          currentPage + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut
                      );
                    },
                    child: Icon(Icons.chevron_right, color: Color(0xFF1A237E),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget overBar(String text) {
    return Container(
      height: 100.0,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 12,
              color: Color(0xFF3F51B5),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFF3F51B5),
              child: Text(text, style: BaseTextStyles.h2,),
            ),
          )
        ],
      ),
    );
  }
}