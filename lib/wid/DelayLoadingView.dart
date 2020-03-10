import 'package:flutter/cupertino.dart';

class DelayLoadingView extends StatefulWidget {
  final Widget child;

  bool waiting;

  DelayLoadingView({Key key, this.child, this.waiting}): super(key: key);

  @override
  State<StatefulWidget> createState() => DelayLoadingViewState();
}

class DelayLoadingViewState extends State<DelayLoadingView> {
  final loadingTransform = Matrix4.identity()..translate(0, 0, 0);
  final waitingTransform = Matrix4.identity()..translate(0, 50, 0);

  //var _waiting = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
          opacity: widget.waiting ? 0 : 1,
          child: widget.child
      ),
      transform: widget.waiting ? waitingTransform : loadingTransform,
    );
  }
}