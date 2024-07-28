import 'package:json_annotation/json_annotation.dart';

part 'amibo.g.dart';

@JsonSerializable()
class Amibo {
  final List<Amiibo>? amiibo;

  const Amibo({
    this.amiibo,
  });

  factory Amibo.fromJson(Map<String, dynamic> json) => _$AmiboFromJson(json);

  Map<String, dynamic> toJson() => _$AmiboToJson(this);
}

@JsonSerializable()
class Amiibo {
  final String? amiiboSeries;
  final String? character;
  final String? gameSeries;
  final String? head;
  final String? image;
  final String? name;
  final Release? release;
  final String? tail;
  final String? type;

  const Amiibo({
    this.amiiboSeries,
    this.character,
    this.gameSeries,
    this.head,
    this.image,
    this.name,
    this.release,
    this.tail,
    this.type,
  });

  factory Amiibo.fromJson(Map<String, dynamic> json) => _$AmiiboFromJson(json);

  Map<String, dynamic> toJson() => _$AmiiboToJson(this);
}

@JsonSerializable()
class Release {
  final String? au;
  final String? eu;
  final String? jp;
  final String? na;

  const Release({
    this.au,
    this.eu,
    this.jp,
    this.na,
  });

  factory Release.fromJson(Map<String, dynamic> json) =>
      _$ReleaseFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}
