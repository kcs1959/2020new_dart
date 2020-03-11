import 'package:flutter/cupertino.dart';

class DelayLoadingViewLite extends StatefulWidget {
  final Widget child;

  bool waiting;

  DelayLoadingViewLite({Key key, this.child, this.waiting}): super(key: key);

  @override
  State<StatefulWidget> createState() => DelayLoadingViewLiteState();
}

class DelayLoadingViewLiteState extends State<DelayLoadingViewLite> {
  @override
  Widget build(BuildContext context) {
    /*
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 0),
        opacity: widget.waiting ? 0 : 1,
        child: widget.child
    );*/
    return Opacity(
      opacity: widget.waiting ? 0 : 1,
      child: widget.child,
    );
    /*
    return Visibility(
      visible: !widget.waiting,
      child: widget.child,
    );

     */
  }
}