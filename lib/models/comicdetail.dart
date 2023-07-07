import 'package:json_annotation/json_annotation.dart';

import 'comics.dart';

part 'comicdetail.g.dart';

@JsonSerializable()
class ComicDetail {
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
  Results? results;
  @JsonKey(name: 'version')
  String? version;

  ComicDetail({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  factory ComicDetail.fromJson(Map<String, dynamic> json) =>
      _$ComicDetailFromJson(json);

  Map<String, dynamic> toRawJson() => _$ComicDetailToJson(this);
}

@JsonSerializable()
class Results {
  dynamic aliases;
  String? apiDetailUrl;
  List<AssociatedImage>? associatedImages;
  @JsonKey(name: 'character_credits')
  List<Volume>? characterCredits;
  List<dynamic>? characterDiedIn;
  List<Volume>? conceptCredits;
  DateTime? coverDate;
  DateTime? dateAdded;
  DateTime? dateLastUpdated;
  dynamic deck;
  String? description;
  dynamic firstAppearanceCharacters;
  dynamic firstAppearanceConcepts;
  dynamic firstAppearanceLocations;
  dynamic firstAppearanceObjects;
  dynamic firstAppearanceStoryarcs;
  dynamic firstAppearanceTeams;
  bool? hasStaffReview;
  int? id;
  Image? image;
  String? issueNumber;
  @JsonKey(name: 'location_credits')
  List<Volume>? locationCredits;
  String? name;
  List<dynamic>? objectCredits;
  List<Volume>? personCredits;
  String? siteDetailUrl;
  dynamic storeDate;
  List<dynamic>? storyArcCredits;
  @JsonKey(name: 'team_credits')
  List<Volume>? teamCredits;
  List<dynamic>? teamDisbandedIn;
  Volume? volume;

  Results({
    this.aliases,
    this.apiDetailUrl,
    this.associatedImages,
    this.characterCredits,
    this.characterDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryarcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.locationCredits,
    this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamDisbandedIn,
    this.volume,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toRawJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class CharacterCredit {
  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  CharacterCredit({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  factory CharacterCredit.fromJson(Map<String, dynamic> json) =>
      _$CharacterCreditFromJson(json);

  Map<String, dynamic> toRawJson() => _$CharacterCreditToJson(this);
}
