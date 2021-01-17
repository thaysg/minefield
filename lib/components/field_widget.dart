import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) changeMark;

  const FieldWidget(
      {@required this.field, @required this.onOpen, @required this.changeMark});

  Widget _getImage() {
    int qtMines = field.qtminesintheNeighborhood;
    if (field.opened && field.mined && field.exploded) {
      return Image.asset('images/explodido.jpg');
    } else if (field.opened && field.mined) {
      return Image.asset('images/!explodido.jpg');
    } else if (field.opened) {
      return Image.asset('images/aberto_$qtMines.jpg');
    } else if (field.marked) {
      return Image.asset('images/marked.jpg');
    } else {
      return Image.asset('images/fechado.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => changeMark(field),
      child: _getImage(),
    );
  }
}
