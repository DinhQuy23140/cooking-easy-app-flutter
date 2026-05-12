
import 'package:flutter/cupertino.dart';

class ShapeCircleGlass {
  static final shapeCircleGlass = BoxDecoration(
    color: const Color(0x1AFFFFFF),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    border: Border.all(
      color: const Color(0x2AFFFFFF),
      width: 1,
    )
  );
}