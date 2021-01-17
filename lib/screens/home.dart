import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result.dart';
import 'package:minefield/models/board_model.dart';
import 'package:minefield/models/exception_explosion.dart';
import 'package:minefield/models/field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _won;
  MineBoard _mineBoard;

  void _reset() {
    setState(() {
      _won = null;
      _mineBoard.reset();
    });
  }

  void _toOpen(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      try {
        field.toOpen();
        if (_mineBoard.solved) {
          _won = true;
        }
      } on ExceptionExplosotion {
        _won = false;
        _mineBoard.revealBombs();
      }
    });
  }

  void _changeMark(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      field.changeMark();
      if (_mineBoard.solved) {
        _won = true;
      }
    });
  }

  MineBoard _getMineBoard(double width, double height) {
    if (_mineBoard == null) {
      int qtColumns = 15;
      double sizeField = width / qtColumns;
      int qtRows = (height / sizeField).floor();

      _mineBoard = MineBoard(
        myRows: qtRows,
        myColumns: qtColumns,
        qtBombs: 50,
      );
    }
    return _mineBoard;
  }

  @override
  Widget build(BuildContext context) {
    /*  Field neighbor1 = Field(myRow: 1, myColumn: 0);
    neighbor1.toMine();

    Field neighbor2 = Field(myRow: 2, myColumn: 2);
    neighbor2.toMine();

    Field field = Field(myRow: 0, myColumn: 0);
    field.addNeighbor(neighbor1);
    field.addNeighbor(neighbor2);

    try {
      //field.toMine();
      //field.toOpen();
      field.switchMarket();
    } on ExceptionExplosotion {} */

    return Scaffold(
      appBar: ResultWidget(
        won: _won,
        onReset: _reset,
      ),
      body: Container(
        color: Colors.grey.shade900,
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return BoardWidget(
              board: _getMineBoard(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              onOpen: _toOpen,
              changeMark: _changeMark,
            );
          },
        ),
      ),
    );
  }
}
