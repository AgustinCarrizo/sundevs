import 'package:json_annotation/json_annotation.dart';

part 'comics.g.dart';

@JsonSerializable()
class Comics {
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
  List<Comic>? results;
  @JsonKey(name: 'version')
  String? version;

  Comics({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory Comics.fromJson(Map<String, dynamic> json) =>
      _$ComicsFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsToJson(this);
}

@JsonSerializable()
class Comic {
  @JsonKey(name: 'aliases')
  dynamic aliases;
  @JsonKey(name: 'api_detail_url')
  String? apiDetailUrl;
  @JsonKey(name: 'cover_date')
  String? coverDate;
  @JsonKey(name: 'date_added')
  String? dateAdded;
  @JsonKey(name: 'date_last_updated')
  String? dateLastUpdated;
  @JsonKey(name: 'deck')
  dynamic deck;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'has_staff_review')
  bool? hasStaffReview;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  Image? image;
  @JsonKey(name: 'associated_images')
  List<AssociatedImage>? associatedImages;
  @JsonKey(name: 'issue_number')
  String? issueNumber;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'site_detail_url')
  String? siteDetailUrl;
  @JsonKey(name: 'store_date')
  dynamic storeDate;
  @JsonKey(name: 'volume')
  Volume? volume;

  Comic({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.associatedImages,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);
  Map<String, dynamic> toJson() => _$ComicToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: 'icon_url')
  String? iconUrl;
  @JsonKey(name: 'medium_url')
  String? mediumUrl;
  @JsonKey(name: 'screen_url')
  String? screenUrl;
  @JsonKey(name: 'screen_large_url')
  String? screenLargeUrl;
  @JsonKey(name: 'small_url')
  String? smallUrl;
  @JsonKey(name: 'super_url')
  String? superUrl;
  @JsonKey(name: 'thumb_url')
  String? thumbUrl;
  @JsonKey(name: 'tiny_url')
  String? tinyUrl;
  @JsonKey(name: 'original_url')
  String? originalUrl;
  @JsonKey(name: 'image_tags')
  String? imageTags;

  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class AssociatedImage {
  @JsonKey(name: 'original_url')
  String? originalUrl;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'caption')
  dynamic caption;
  @JsonKey(name: 'image_tags')
  String? imageTags;

  AssociatedImage({
    this.originalUrl,
    this.id,
    this.caption,
    this.imageTags,
  });

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      _$AssociatedImageFromJson(json);
  Map<String, dynamic> toJson() => _$AssociatedImageToJson(this);
}

@JsonSerializable()
class Volume {
  @JsonKey(name: 'api_detail_url')
  String? apiDetailUrl;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'site_detail_url')
  String? siteDetailUrl;

  Volume({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}