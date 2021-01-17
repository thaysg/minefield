import 'dart:math';

import 'field.dart';
import 'package:flutter/foundation.dart';

class MineBoard {
  final int myRows;
  final int myColumns;
  final int qtBombs;

  final List<Field> _fields = [];

  MineBoard({
    @required this.myRows,
    @required this.myColumns,
    @required this.qtBombs,
  }) {
    _createFields();
    _releateNeighbors();
    _sortBombs();
  }

  void reset() {
    _fields.forEach((f) => f.reset());
    _sortBombs();
  }

  void revealBombs() {
    _fields.forEach((f) => f.revealBomb());
  }

  void _createFields() {
    for (int r = 0; r < myRows; r++) {
      for (int c = 0; c < myColumns; c++) {
        _fields.add(Field(myRow: r, myColumn: c));
      }
    }
  }

  void _releateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _sortBombs() {
    int sorted = 0;

    if (qtBombs > myRows * myColumns) {
      return;
    }

    while (sorted < qtBombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        sorted++;
        _fields[i].toMine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solved {
    return _fields.every((f) => f.solved);
  }
}
