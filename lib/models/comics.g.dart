// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comics _$ComicsFromJson(Map<String, dynamic> json) => Comics(
      error: json['error'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      numberOfPageResults: json['number_of_page_results'] as int?,
      numberOfTotalResults: json['number_of_total_results'] as int?,
      statusCode: json['status_code'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Comic.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ComicsToJson(Comics instance) => <String, dynamic>{
      'error': instance.error,
      'limit': instance.limit,
      'offset': instance.offset,
      'number_of_page_results': instance.numberOfPageResults,
      'number_of_total_results': instance.numberOfTotalResults,
      'status_code': instance.statusCode,
      'results': instance.results,
      'version': instance.version,
    };

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      aliases: json['aliases'],
      apiDetailUrl: json['api_detail_url'] as String?,
      coverDate: json['cover_date'] as String?,
      dateAdded: json['date_added'] as String?,
      dateLastUpdated: json['date_last_updated'] as String?,
      deck: json['deck'],
      description: json['description'] as String?,
      hasStaffReview: json['has_staff_review'] as bool?,
      id: json['id'] as int?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      associatedImages: (json['associated_images'] as List<dynamic>?)
          ?.map((e) => AssociatedImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      issueNumber: json['issue_number'] as String?,
      name: json['name'] as String?,
      siteDetailUrl: json['site_detail_url'] as String?,
      storeDate: json['store_date'],
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'api_detail_url': instance.apiDetailUrl,
      'cover_date': instance.coverDate,
      'date_added': instance.dateAdded,
      'date_last_updated': instance.dateLastUpdated,
      'deck': instance.deck,
      'description': instance.description,
      'has_staff_review': instance.hasStaffReview,
      'id': instance.id,
      'image': instance.image,
      'associated_images': instance.associatedImages,
      'issue_number': instance.issueNumber,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
      'store_date': instance.storeDate,
      'volume': instance.volume,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      iconUrl: json['icon_url'] as String?,
      mediumUrl: json['medium_url'] as String?,
      screenUrl: json['screen_url'] as String?,
      screenLargeUrl: json['screen_large_url'] as String?,
      smallUrl: json['small_url'] as String?,
      superUrl: json['super_url'] as String?,
      thumbUrl: json['thumb_url'] as String?,
      tinyUrl: json['tiny_url'] as String?,
      originalUrl: json['original_url'] as String?,
      imageTags: json['image_tags'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'icon_url': instance.iconUrl,
      'medium_url': instance.mediumUrl,
      'screen_url': instance.screenUrl,
      'screen_large_url': instance.screenLargeUrl,
      'small_url': instance.smallUrl,
      'super_url': instance.superUrl,
      'thumb_url': instance.thumbUrl,
      'tiny_url': instance.tinyUrl,
      'original_url': instance.originalUrl,
      'image_tags': instance.imageTags,
    };

AssociatedImage _$AssociatedImageFromJson(Map<String, dynamic> json) =>
    AssociatedImage(
      originalUrl: json['original_url'] as String?,
      id: json['id'] as int?,
      caption: json['caption'],
      imageTags: json['image_tags'] as String?,
    );

Map<String, dynamic> _$AssociatedImageToJson(AssociatedImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
      'id': instance.id,
      'caption': instance.caption,
      'image_tags': instance.imageTags,
    };

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
      apiDetailUrl: json['api_detail_url'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      siteDetailUrl: json['site_detail_url'] as String?,
    );

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
    };
