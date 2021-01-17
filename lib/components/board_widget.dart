import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/models/board_model.dart';
import 'package:minefield/models/field.dart';

class BoardWidget extends StatelessWidget {
  final MineBoard board;
  final void Function(Field) onOpen;
  final void Function(Field) changeMark;

  const BoardWidget(
      {@required this.board, @required this.onOpen, @required this.changeMark});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.myColumns,
        children: board.fields.map((f) {
          return FieldWidget(
            field: f,
            onOpen: onOpen,
            changeMark: changeMark,
          );
        }).toList(),
      ),
    );
  }
}
