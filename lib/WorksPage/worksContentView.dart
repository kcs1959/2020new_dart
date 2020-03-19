import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/workInfo.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/works.dart';
import 'package:kcs_2020_shinkan_web/WorksPage/worksTile.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:expanded_grid/expanded_grid.dart';

class WorksContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  WorksContentView({Key key, this.deviceInfo}): super(key: key);

  final works = WorksData().works;

  @override
  Widget build(BuildContext context) {
    //return UnderConstructionView(deviceInfo: deviceInfo,);
    return Container(
      width: deviceInfo.size.width,
      height: deviceInfo.size.height - 60,
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
              child: Text("KCS Works 2019", style: BaseTextStyles.h1Tint(deviceInfo,),),
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
}