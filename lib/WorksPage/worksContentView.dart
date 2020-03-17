import 'package:flutter/material.dart';
import 'package:kcs_2020_shinkan_web/mainPage.dart';
import 'package:kcs_2020_shinkan_web/style/TextStyles.dart';
import 'package:expanded_grid/expanded_grid.dart';

class WorksContentView extends StatelessWidget {
  final DeviceInfo deviceInfo;

  WorksContentView({Key key, this.deviceInfo}): super(key: key);

  @override
  Widget build(BuildContext context) {
    //return UnderConstructionView(deviceInfo: deviceInfo,);
    return Container(
      width: deviceInfo.size.width,
      height: deviceInfo.size.height - 60,
      child: ExpandedGrid(
        column: 7, row: 5,
        children: <ExpandedGridContent>[
          ExpandedGridContent(
            rowIndex: 0, columnIndex: 0,
            columnSpan: 2,
            child: Container(color: Colors.green,),
          ),
          ExpandedGridContent(
            rowIndex: 0, columnIndex: 2,
            rowSpan: 2, columnSpan: 2,
            child: Container(color: Colors.red,),
          ),
          ExpandedGridContent(
            rowIndex: 0, columnIndex: 4,
            columnSpan: 3,
            child: Container(color: Colors.teal,),
          ),
          ExpandedGridContent(
            rowIndex: 1, columnIndex: 0,
            rowSpan: 2, columnSpan: 2,
            child: Container(color: Colors.blue,),
          ),
          ExpandedGridContent(
            rowIndex: 1, columnIndex: 4,
            columnSpan: 2,
            child: Container(color: Colors.lightGreen,),
          ),
          ExpandedGridContent(
            rowIndex: 1, columnIndex: 6,
            rowSpan: 2,
            child: Container(color: Colors.pink,),
          ),
          ExpandedGridContent(
            rowIndex: 2, columnIndex: 2,
            columnSpan: 3,
            child: Center(
              child: Text("KCS Works 2019", style: BaseTextStyles.h1Tint(deviceInfo,),),
            )
          ),
          ExpandedGridContent(
            rowIndex: 2, columnIndex: 5,
            child: Container(color: Colors.lightBlue,),
          ),
          ExpandedGridContent(
            rowIndex: 3, columnIndex: 0,
            rowSpan: 2,
            child: Container(color: Colors.greenAccent,),
          ),
          ExpandedGridContent(
            rowIndex: 3, columnIndex: 1,
            child: Container(color: Colors.orange,),
          ),
          ExpandedGridContent(
            rowIndex: 3, columnIndex: 2,
            child: Container(color: Colors.tealAccent,),
          ),
          ExpandedGridContent(
            rowIndex: 3, columnIndex: 3,
            columnSpan: 2,
            child: Container(color: Colors.blueGrey,),
          ),
          ExpandedGridContent(
            rowIndex: 3, columnIndex: 5,
            rowSpan: 2, columnSpan: 2,
            child: Container(color: Colors.lightGreenAccent),
          ),
          ExpandedGridContent(
            rowIndex: 4, columnIndex: 1,
            child: Container(color: Colors.lightBlueAccent,),
          ),
          ExpandedGridContent(
            rowIndex: 4, columnIndex: 2,
            columnSpan: 2,
            child: Container(color: Colors.cyan,),
          ),
          ExpandedGridContent(
            rowIndex: 4, columnIndex: 4,
            child: Container(color: Colors.pinkAccent,),
          ),
        ],
      ),
    );
  }
}