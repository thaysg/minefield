import 'package:flutter/foundation.dart';
import 'exception_explosion.dart';

class Field {
  final int myRow;
  final int myColumn;
  final List<Field> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Field({
    @required this.myRow,
    @required this.myColumn,
  });

  void addNeighbor(Field neighbor) {
    final deltaRow = (myRow - neighbor.myRow).abs();
    final deltaColumn = (myColumn - neighbor.myColumn).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaRow <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void toOpen() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExceptionExplosotion();
    }

    if (saveNeighborhood) {
      neighbors.forEach((v) => v.toOpen());
    }
  }

  void revealBomb() {
    if (_mined) {
      _opened = true;
    }
  }

  void toMine() {
    _mined = true;
  }

  void changeMark() {
    _marked = !_marked;
  }

  void reset() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get solved {
    bool minedAndMarked = mined && marked;
    bool saveAndOpened = !mined && opened;
    return minedAndMarked || saveAndOpened;
  }

  bool get saveNeighborhood {
    return neighbors.every((n) => !n.mined);
  }

  int get qtminesintheNeighborhood {
    return neighbors.where((n) => n.mined).length;
  }
}
