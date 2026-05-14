
import 'package:cooking_easy/features/main/data/dto/AreaResponseDto.dart';

import '../model/area.dart';

class Areamapper {
  static Area toArea(AreaDto areaDto) {
    return Area(
      strArea: areaDto.strArea,
      strAreaDescription: areaDto.strCountry,
    );
  }

  static List<Area>? toListArea(List<AreaDto>? areaDtoList) {
    if (areaDtoList == null) {
      return <Area>[];
    }
    return areaDtoList.map((areaDto) => toArea(areaDto)).toList();
  }
}