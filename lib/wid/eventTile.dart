import 'package:flutter/material.dart';
class eventTile extends StatefulWidget {
  final Color bgColor;
  final String date;
  final String title;
  final String description;
  // You can also pass the translation in here if you want to
  eventTile({Key key,this.title = "", this.date = "", this.description = "", this.bgColor}) : super(key: key);
  @override
  _eventTileState createState() => _eventTileState();
}
class _eventTileState extends State<eventTile> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);
  
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: _hovering ? Colors.transparent : widget.bgColor,
            border: Border.all(color: Colors.blueGrey)
          ),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: _hovering ? TextStyle(color: Colors.black87) : TextStyle(color: Colors.white70),
            child: ListTile(
              title: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: _hovering ? TextStyle(color: Colors.black87) : TextStyle(color: Colors.white70),
                  child: Text(widget.date)
              ),
              subtitle: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: _hovering ? TextStyle(color: Colors.black87, fontSize: 30.0) : TextStyle(color: Colors.white70, fontSize: 30.0),
                  child: Text(widget.title)
              ),
              trailing: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: _hovering ? TextStyle(color: Colors.black87) : TextStyle(color: Colors.white70),
                  child: Text(widget.description)
              ),
            ),
          )
        )
      ),
    );
  }
  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}