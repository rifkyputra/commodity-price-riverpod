import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newgen_flutter/models/price_region.dart';

part 'commodity.g.dart';

// @JsonSerializable(explicitToJson: true)
@collection
class Commodity {
  Id id = Isar.autoIncrement;

  final String name;
  final List<PriceRegion> priceRegional;
  final String? updatedAt;

  Commodity({
    required this.name,
    required this.priceRegional,
    this.updatedAt,
  });

  // factory Commodity.fromJson(Map<String, dynamic> json) => Commodity(name: json.keys.first, priceRegional: json)
}
