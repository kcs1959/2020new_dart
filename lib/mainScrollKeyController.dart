import 'package:flutter/cupertino.dart';

class MainScrollController {
  GlobalKey _topKey, _whatKey, _shinkanKey, _worksKey, _qaKey, _footerKey;
  ScrollController _scrollController;

  ScrollController get controller => _scrollController;

  GlobalKey get topKey => _topKey;
  GlobalKey get whatKey => _whatKey;
  GlobalKey get shinkanKey => _shinkanKey;
  GlobalKey get worksKey => _worksKey;
  GlobalKey get qaKey => _qaKey;
  GlobalKey get footerKey => _footerKey;

  MainScrollController() {
    _topKey = GlobalKey();
    _whatKey = GlobalKey();
    _shinkanKey = GlobalKey();
    _worksKey = GlobalKey();
    _qaKey = GlobalKey();
    _footerKey = GlobalKey();
    _scrollController = ScrollController();
  }

  void dispose() {
    _scrollController.dispose();
  }

  void addListener(VoidCallback listener) => _scrollController.addListener(listener);

  double topHeight() => _topKey.currentContext.size.height;
  double whatHeight() => _whatKey.currentContext.size.height;
  double shinkanHeight() => _shinkanKey.currentContext.size.height;
  double worksHeight() => _worksKey.currentContext.size.height;
  double qaHeight() => _qaKey.currentContext.size.height;
  double footerHeight() => _footerKey.currentContext.size.height;

  double get _currentPosition => _scrollController.offset;

  double get topOfTop => 0;
  double get topOfWhat => topHeight();
  double get topOfShinkan => topOfWhat + whatHeight();
  double get topOfWork => topOfShinkan + shinkanHeight();
  double get topOfQA => topOfWork + worksHeight();
  double get topOfFooter => topOfQA + qaHeight();

  bool inTop(double displayHeight) {
    return topOfTop <= _currentPosition + displayHeight && topOfWhat >= _currentPosition;
  }

  bool inWhat(double displayHeight) {
    return topOfWhat <= _currentPosition + displayHeight && topOfShinkan >= _currentPosition;
  }

  bool inShinkan(double displayHeight) {
    return topOfShinkan <= _currentPosition + displayHeight && topOfWork >= _currentPosition;
  }

  bool inWork(double displayHeight) {
    return topOfWork <= _currentPosition + displayHeight && topOfQA >= _currentPosition;
  }

  bool inQA(double displayHeight) {
    return topOfQA <= _currentPosition + displayHeight && topOfFooter >= _currentPosition;
  }

  bool inFooter(double displayHeight) {
    return topOfFooter <= _currentPosition + displayHeight;
  }
}
