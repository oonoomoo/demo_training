// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amibo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amibo _$AmiboFromJson(Map<String, dynamic> json) => Amibo(
      amiibo: (json['amiibo'] as List<dynamic>?)
          ?.map((e) => Amiibo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AmiboToJson(Amibo instance) => <String, dynamic>{
      'amiibo': instance.amiibo,
    };

Amiibo _$AmiiboFromJson(Map<String, dynamic> json) => Amiibo(
      amiiboSeries: json['amiiboSeries'] as String?,
      character: json['character'] as String?,
      gameSeries: json['gameSeries'] as String?,
      head: json['head'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      release: json['release'] == null
          ? null
          : Release.fromJson(json['release'] as Map<String, dynamic>),
      tail: json['tail'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AmiiboToJson(Amiibo instance) => <String, dynamic>{
      'amiiboSeries': instance.amiiboSeries,
      'character': instance.character,
      'gameSeries': instance.gameSeries,
      'head': instance.head,
      'image': instance.image,
      'name': instance.name,
      'release': instance.release,
      'tail': instance.tail,
      'type': instance.type,
    };

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
      au: json['au'] as String?,
      eu: json['eu'] as String?,
      jp: json['jp'] as String?,
      na: json['na'] as String?,
    );

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'au': instance.au,
      'eu': instance.eu,
      'jp': instance.jp,
      'na': instance.na,
    };
