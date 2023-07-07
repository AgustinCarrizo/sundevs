// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagendetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagenDetail _$ImagenDetailFromJson(Map<String, dynamic> json) => ImagenDetail(
      error: json['error'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      numberOfPageResults: json['number_of_page_results'] as int?,
      numberOfTotalResults: json['number_of_total_results'] as int?,
      statusCode: json['status_code'] as int?,
      results: json['results'] == null
          ? null
          : Imagen.fromJson(json['results'] as Map<String, dynamic>),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ImagenDetailToJson(ImagenDetail instance) =>
    <String, dynamic>{
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.numberOfPageResults,
      'number_of_total_results': instance.numberOfTotalResults,
      'status_code': instance.statusCode,
      'results': instance.results,
      'version': instance.version,
    };

Imagen _$ImagenFromJson(Map<String, dynamic> json) => Imagen(
      id: json['id'] as int?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagenToJson(Imagen instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
