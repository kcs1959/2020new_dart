extension MyList<E, T> on List<T> {
  //https://stackoverflow.com/questions/54898767/enumerate-or-map-through-a-list-with-index-and-value-in-dart のやつを拡張関数に書き換えたやつ
  List<E> mapIndexed<E>(E Function(int index, T item) f) {
    var index = 0;
    var ret = List<E>();

    for (final item in this) {
      ret.add(f(index, item));
      index = index + 1;
    }
    return ret;
  }

  List<T> nonNull() {
    return this.where((t) => t != null).toList();
  }
}