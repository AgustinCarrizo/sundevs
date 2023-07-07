import 'package:json_annotation/json_annotation.dart';

import 'comics.dart';

part 'imagendetail.g.dart';

@JsonSerializable()
class ImagenDetail {
  @JsonKey(name: 'error')
  String? error;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'offset')
  int? offset;
  @JsonKey(name: 'number_of_page_results')
  int? numberOfPageResults;
  @JsonKey(name: 'number_of_total_results')
  int? numberOfTotalResults;
  @JsonKey(name: 'status_code')
  int? statusCode;
  @JsonKey(name: 'results')
  Imagen? results;
  @JsonKey(name: 'version')
  String? version;

  ImagenDetail({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory ImagenDetail.fromJson(Map<String, dynamic> json) =>
      _$ImagenDetailFromJson(json);

  Map<String, dynamic> toRawJson() => _$ImagenDetailToJson(this);
}

@JsonSerializable()
class Imagen {
  int? id;
  Image? image;

  Imagen({
    this.id,
    this.image,
  });

  factory Imagen.fromJson(Map<String, dynamic> json) =>
      _$ImagenFromJson(json);

  Map<String, dynamic> toRawJson() => _$ImagenToJson(this);
}
