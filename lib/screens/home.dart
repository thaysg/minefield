import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/components/result.dart';
import 'package:minefield/models/exception_explosion.dart';
import 'package:minefield/models/field.dart';

class HomeScreen extends StatelessWidget {
  void _reset() {
    print('reset....');
  }

  void _open(Field f) {
    print('open....');
  }

  void _changeMark(Field f) {
    print('changeMark....');
  }

  @override
  Widget build(BuildContext context) {
    Field neighbor1 = Field(myRow: 1, myColumn: 0);
    neighbor1.toMine();

    Field field = Field(myRow: 0, myColumn: 0);
    field.addNeighbor(neighbor1);

    try {
      //field.toMine();
      field.toOpen();
    } on ExceptionExplosotion {}

    return Scaffold(
      appBar: ResultWidget(
        won: true,
        onReset: _reset,
      ),
      body: FieldWidget(
        field: field,
        onOpen: _open,
        changeMark: _changeMark,
      ),
    );
  }
}
