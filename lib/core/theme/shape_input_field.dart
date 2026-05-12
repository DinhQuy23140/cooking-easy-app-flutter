
import 'package:flutter/material.dart';

class ShapeInputField {
  static final shapeInputField = InputDecoration(
    filled: true,
    fillColor: Color(0x1A43A047),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color(0x2A43A047),
        width: 1,
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Color(0x2A43A047),
        width: 2,
      )
    )
  );
}