import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) changeMark;

  const FieldWidget(
      {@required this.field, @required this.onOpen, @required this.changeMark});

  Widget _getImage() {
    if (field.opened && field.mined && field.exploded) {
      return Container(
        color: Colors.grey,
        child: Image.asset(
          'images/bomb1.png',
          height: 50,
        ),
      );
    } else if (field.opened) {
      return Image.asset(
        'images/square.png',
        color: Colors.grey.shade700,
        height: 50,
      );
    } else {
      return Image.asset(
        'images/square.png',
        color: Colors.grey.shade800,
        height: 50,
      );
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
