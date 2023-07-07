// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicDetail _$ComicDetailFromJson(Map<String, dynamic> json) => ComicDetail(
      error: json['error'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      numberOfPageResults: json['number_of_page_results'] as int?,
      numberOfTotalResults: json['number_of_total_results'] as int?,
      statusCode: json['status_code'] as int?,
      results: json['results'] == null
          ? null
          : Results.fromJson(json['results'] as Map<String, dynamic>),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$ComicDetailToJson(ComicDetail instance) =>
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

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      aliases: json['aliases'],
      apiDetailUrl: json['apiDetailUrl'] as String?,
      associatedImages: (json['associatedImages'] as List<dynamic>?)
          ?.map((e) => AssociatedImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterCredits: (json['character_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      characterDiedIn: json['characterDiedIn'] as List<dynamic>?,
      conceptCredits: (json['conceptCredits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverDate: json['coverDate'] == null
          ? null
          : DateTime.parse(json['coverDate'] as String),
      dateAdded: json['dateAdded'] == null
          ? null
          : DateTime.parse(json['dateAdded'] as String),
      dateLastUpdated: json['dateLastUpdated'] == null
          ? null
          : DateTime.parse(json['dateLastUpdated'] as String),
      deck: json['deck'],
      description: json['description'] as String?,
      firstAppearanceCharacters: json['firstAppearanceCharacters'],
      firstAppearanceConcepts: json['firstAppearanceConcepts'],
      firstAppearanceLocations: json['firstAppearanceLocations'],
      firstAppearanceObjects: json['firstAppearanceObjects'],
      firstAppearanceStoryarcs: json['firstAppearanceStoryarcs'],
      firstAppearanceTeams: json['firstAppearanceTeams'],
      hasStaffReview: json['hasStaffReview'] as bool?,
      id: json['id'] as int?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      issueNumber: json['issueNumber'] as String?,
      locationCredits: (json['location_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      objectCredits: json['objectCredits'] as List<dynamic>?,
      personCredits: (json['personCredits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      siteDetailUrl: json['siteDetailUrl'] as String?,
      storeDate: json['storeDate'],
      storyArcCredits: json['storyArcCredits'] as List<dynamic>?,
      teamCredits: (json['team_credits'] as List<dynamic>?)
          ?.map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamDisbandedIn: json['teamDisbandedIn'] as List<dynamic>?,
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'apiDetailUrl': instance.apiDetailUrl,
      'associatedImages': instance.associatedImages,
      'character_credits': instance.characterCredits,
      'characterDiedIn': instance.characterDiedIn,
      'conceptCredits': instance.conceptCredits,
      'coverDate': instance.coverDate?.toIso8601String(),
      'dateAdded': instance.dateAdded?.toIso8601String(),
      'dateLastUpdated': instance.dateLastUpdated?.toIso8601String(),
      'deck': instance.deck,
      'description': instance.description,
      'firstAppearanceCharacters': instance.firstAppearanceCharacters,
      'firstAppearanceConcepts': instance.firstAppearanceConcepts,
      'firstAppearanceLocations': instance.firstAppearanceLocations,
      'firstAppearanceObjects': instance.firstAppearanceObjects,
      'firstAppearanceStoryarcs': instance.firstAppearanceStoryarcs,
      'firstAppearanceTeams': instance.firstAppearanceTeams,
      'hasStaffReview': instance.hasStaffReview,
      'id': instance.id,
      'image': instance.image,
      'issueNumber': instance.issueNumber,
      'location_credits': instance.locationCredits,
      'name': instance.name,
      'objectCredits': instance.objectCredits,
      'personCredits': instance.personCredits,
      'siteDetailUrl': instance.siteDetailUrl,
      'storeDate': instance.storeDate,
      'storyArcCredits': instance.storyArcCredits,
      'team_credits': instance.teamCredits,
      'teamDisbandedIn': instance.teamDisbandedIn,
      'volume': instance.volume,
    };

CharacterCredit _$CharacterCreditFromJson(Map<String, dynamic> json) =>
    CharacterCredit(
      apiDetailUrl: json['apiDetailUrl'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      siteDetailUrl: json['siteDetailUrl'] as String?,
    );

Map<String, dynamic> _$CharacterCreditToJson(CharacterCredit instance) =>
    <String, dynamic>{
      'apiDetailUrl': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'siteDetailUrl': instance.siteDetailUrl,
    };
