import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'price_region.g.dart';

@JsonSerializable()
@embedded
class PriceRegion {
  final String? id;
  @JsonKey(name: 'name')
  final String? regionName;
  final String? value;
  final String? display;

  PriceRegion({
    this.id,
    this.regionName,
    this.value,
    this.display,
  });

  factory PriceRegion.fromJson(Map<String, dynamic> json) =>
      _$PriceRegionFromJson(json);
}
