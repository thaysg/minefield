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

  Field({@required this.myRow, @required this.myColumn});

  //Check neighbors
  void addNeighbor(Field neighbor) {
    final deltaRow = (myRow - neighbor.myRow).abs();
    final deltaColumn = (myColumn - neighbor.myColumn).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }
    if (deltaRow <= 1 && deltaColumn < 1) {
      neighbors.add(neighbor);
    }
  }

  //Open Mines
  void toOpen() {
    if (_opened) {
      return;
    }
    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExceptionExplosotion();
    }

    //recursividade - If it's save will open more fields
    if (saveNeighborhood) {
      neighbors.forEach((n) => n.toOpen());
    }
  }

  //reveal bombs
  void revealBomb() {
    if (_mined) {
      _opened = true;
    }
  }

  void toMine() {
    _mined = true;
  }

  void switchMarket() {
    _marked = !_marked;
  }

  void reset() {
    _opened = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  //getter mined
  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get market {
    return _marked;
  }

  bool get solved {
    bool mineAndMarket = mined && market;
    bool saveAndOpened = !mined && opened;
    return mineAndMarket || saveAndOpened;
  }

  //Save Neighborhood
  bool get saveNeighborhood {
    return neighbors.every((n) => !n._mined);
  }

  //calculate mines
  int get minesInTheNeighborhood {
    return neighbors.where((n) => n.mined).length;
  }
}
