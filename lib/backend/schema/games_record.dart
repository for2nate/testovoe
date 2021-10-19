import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'games_record.g.dart';

abstract class GamesRecord implements Built<GamesRecord, GamesRecordBuilder> {
  static Serializer<GamesRecord> get serializer => _$gamesRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get year;

  @nullable
  String get genre;

  @nullable
  String get country;

  @nullable
  String get description;

  @nullable
  String get image;

  @nullable
  String get trailer;

  @nullable
  String get platform;

  @nullable
  bool get done;

  @nullable
  String get note;

  @nullable
  @BuiltValueField(wireName: 'name_in_russia')
  String get nameInRussia;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GamesRecordBuilder builder) => builder
    ..name = ''
    ..year = ''
    ..genre = ''
    ..country = ''
    ..description = ''
    ..image = ''
    ..trailer = ''
    ..platform = ''
    ..done = false
    ..note = ''
    ..nameInRussia = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GamesRecord._();
  factory GamesRecord([void Function(GamesRecordBuilder) updates]) =
      _$GamesRecord;

  static GamesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGamesRecordData({
  String name,
  String year,
  String genre,
  String country,
  String description,
  String image,
  String trailer,
  String platform,
  bool done,
  String note,
  String nameInRussia,
}) =>
    serializers.toFirestore(
        GamesRecord.serializer,
        GamesRecord((g) => g
          ..name = name
          ..year = year
          ..genre = genre
          ..country = country
          ..description = description
          ..image = image
          ..trailer = trailer
          ..platform = platform
          ..done = done
          ..note = note
          ..nameInRussia = nameInRussia));
