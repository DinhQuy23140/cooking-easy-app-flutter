


class AreaResponseDto {
  List<AreaDto>? meals;

  AreaResponseDto({this.meals});

  factory AreaResponseDto.fromJson(Map<String, dynamic> json) {
    return AreaResponseDto(
      meals: (json['meals'] as List?)?.map((dynamic e) {
        final row = Map<String, dynamic>.from(e as Map);
        return AreaDto.fromJson(row);
      }).toList(),
    );
  }
}

class AreaDto {
  String strArea;
  String strCountry;

  AreaDto({required this.strArea, required this.strCountry});

  factory AreaDto.fromJson(Map<String, dynamic> json) {
    return AreaDto(
      strArea: json['strArea'] as String,
      strCountry: json['strCountry'] as String,
    );
  }
}