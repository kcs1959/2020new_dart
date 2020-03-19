import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksTile.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:expanded_grid/expanded_grid.dart';

class WorksContentView extends StatefulWidget {
  final DeviceInfo deviceInfo;

  WorksContentView({Key key, this.deviceInfo}): super(key: key);
  
  @override
  State<StatefulWidget> createState() => _WorksContentViewState();
}

class _WorksContentViewState extends State<WorksContentView> {
  PageController _pageViewController;

  final works = WorksData().works;

  List<WorkSet> worksets;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();

    worksets = WorkSet.create(works);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return UnderConstructionView(widget.deviceInfo: widget.deviceInfo,);
    if(widget.deviceInfo.displayAspect == DisplayAspect.WIDE
      || widget.deviceInfo.displayAspect == DisplayAspect.NEAR_SQUARE) {
      return Container(
        width: widget.deviceInfo.size.width,
        height: widget.deviceInfo.size.height - 60,
        child: ExpandedGrid(
          column: 10, row: 8,
          children: <ExpandedGridContent>[
            ExpandedGridContent(
                rowIndex: 0, columnIndex: 0,
                rowSpan: 2, columnSpan: 3,
                child: WorksTile(info: works[9])
            ),
            ExpandedGridContent(
                rowIndex: 0, columnIndex: 3,
                rowSpan: 2,
                child: WorksTile(info: works[10])
            ),
            ExpandedGridContent(
                rowIndex: 0, columnIndex: 4,
                columnSpan: 2,
                child: WorksTile(info: works[19])
            ),
            ExpandedGridContent(
                rowIndex: 0, columnIndex: 6,
                rowSpan: 2, columnSpan: 2,
                child: WorksTile(info: works[5])
            ),
            ExpandedGridContent(
                rowIndex: 0, columnIndex: 8,
                columnSpan: 2,
                child: WorksTile(info: works[11])
            ),
            ExpandedGridContent(
                rowIndex: 1, columnIndex: 4,
                rowSpan: 2, columnSpan: 2,
                child: WorksTile(info: works[13])
            ),
            ExpandedGridContent(
                rowIndex: 1, columnIndex: 8,
                rowSpan: 2, columnSpan: 2,
                child: WorksTile(info: works[2])
            ),
            ExpandedGridContent(
                rowIndex: 2, columnIndex: 0,
                rowSpan: 2, columnSpan: 2,
                child: WorksTile(info: works[6])
            ),
            ExpandedGridContent(
                rowIndex: 2, columnIndex: 2,
                columnSpan: 2,
                child: WorksTile(info: works[12])
            ),
            ExpandedGridContent(
                rowIndex: 2, columnIndex: 6,
                columnSpan: 2,
                child: WorksTile(info: works[1])
            ),
            ExpandedGridContent(
                rowIndex: 3, columnIndex: 2,
                rowSpan: 2,
                child: WorksTile(info: works[14])
            ),
            ExpandedGridContent(
                rowIndex: 3, columnIndex: 3,
                rowSpan: 2, columnSpan: 4,
                child: Center(
                  child: Text("KCS Works 2019", style: BaseTextStyles.h1Tint(widget.deviceInfo,),),
                )
            ),
            ExpandedGridContent(
                rowIndex: 3, columnIndex: 7,
                rowSpan: 3, columnSpan: 3,
                child: WorksTile(info: works[0])
            ),
            ExpandedGridContent(
                rowIndex: 4, columnIndex: 0,
                rowSpan: 4, columnSpan: 2,
                child: WorksTile(info: works[8])
            ),
            ExpandedGridContent(
                rowIndex: 5, columnIndex: 2,
                rowSpan: 2, columnSpan: 2,
                child: WorksTile(info: works[7])
            ),
            ExpandedGridContent(
                rowIndex: 5, columnIndex: 4,
                child: WorksTile(info: works[18])
            ),
            ExpandedGridContent(
                rowIndex: 5, columnIndex: 5,
                columnSpan: 2,
                child: WorksTile(info: works[3])
            ),
            ExpandedGridContent(
                rowIndex: 6, columnIndex: 4,
                rowSpan: 2, columnSpan: 2,
                child: WorksTile(info: works[16])
            ),
            ExpandedGridContent(
                rowIndex: 6, columnIndex: 6,
                rowSpan: 2, columnSpan: 3,
                child: WorksTile(info: works[15])
            ),
            ExpandedGridContent(
                rowIndex: 6, columnIndex: 9,
                rowSpan: 2,
                child: WorksTile(info: works[17])
            ),
            ExpandedGridContent(
                rowIndex: 7, columnIndex: 2,
                columnSpan: 2,
                child: WorksTile(info: works[4])
            ),
          ],
        ),
      );
    }
    else {
      return Container(
        width: widget.deviceInfo.size.width,
        height: widget.deviceInfo.size.height - 60,
        child: Column(
          children: <Widget>[
            AutoSizeText(
              "KCS Works\n2019",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: BaseTextStyles.h1(widget.deviceInfo),
            ),
            Expanded(
              child: Row(
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
                      color: Colors.white24,
                      child: Icon(Icons.chevron_left, color: Color(0xFF121212)),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                        controller: _pageViewController,
                        children: worksets.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpandedGrid(
                              row: 3, column: 1,
                              children: [
                                ExpandedGridContent(
                                    rowIndex: 0, columnIndex: 0,
                                    child: WorksTile(info: e.first)
                                ),
                                e.second == null ? ExpandedGridContent(child: Container()) : ExpandedGridContent(
                                    rowIndex: 1, columnIndex: 0,
                                    child: WorksTile(info: e.second)
                                ),
                                e.third == null ? ExpandedGridContent(child: Container()) : ExpandedGridContent(
                                    rowIndex: 2, columnIndex: 0,
                                    child: WorksTile(info: e.third)
                                ),
                              ],
                            ),
                          );
                        }).toList()
                    ),
                  ),
                  ButtonTheme(
                    height: double.infinity,
                    minWidth: 20,
                    child: FlatButton(
                      onPressed: () {
                        var currentPage = (_pageViewController.page + 0.5).floor();
                        if(currentPage >= worksets.length) return;
                        _pageViewController.animateToPage(
                            currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut
                        );
                      },
                      color: Colors.white24,
                      child: Icon(Icons.chevron_right, color: Color(0xFF121212),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

class WorkSet {
  final WorkInfo first;
  final WorkInfo second;
  final WorkInfo third;

  WorkSet(this.first, this.second, this.third);

  static List<WorkSet> create(List<WorkInfo> info) {
    var shuffled = []..addAll(info)..shuffle();
    var result = <WorkSet>[];

    for(int i = 0; i < shuffled.length; i += 3) {
      result.add(WorkSet(
        shuffled[i],
        i+1 < shuffled.length ? shuffled[i+1] : null,
        i+2 < shuffled.length ? shuffled[i+2] : null,
      ));
    }
    return result;
  }
}