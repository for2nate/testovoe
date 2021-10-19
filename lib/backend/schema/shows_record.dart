import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shows_record.g.dart';

abstract class ShowsRecord implements Built<ShowsRecord, ShowsRecordBuilder> {
  static Serializer<ShowsRecord> get serializer => _$showsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'original_name')
  String get originalName;

  @nullable
  String get country;

  @nullable
  String get genre;

  @nullable
  @BuiltValueField(wireName: 'rating_kinopoisk')
  String get ratingKinopoisk;

  @nullable
  @BuiltValueField(wireName: 'rating_imdb')
  String get ratingImdb;

  @nullable
  String get description;

  @nullable
  String get year;

  @nullable
  String get image;

  @nullable
  String get trailer;

  @nullable
  bool get done;

  @nullable
  String get note;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ShowsRecordBuilder builder) => builder
    ..name = ''
    ..originalName = ''
    ..country = ''
    ..genre = ''
    ..ratingKinopoisk = ''
    ..ratingImdb = ''
    ..description = ''
    ..year = ''
    ..image = ''
    ..trailer = ''
    ..done = false
    ..note = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shows');

  static Stream<ShowsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ShowsRecord._();
  factory ShowsRecord([void Function(ShowsRecordBuilder) updates]) =
      _$ShowsRecord;

  static ShowsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createShowsRecordData({
  String name,
  String originalName,
  String country,
  String genre,
  String ratingKinopoisk,
  String ratingImdb,
  String description,
  String year,
  String image,
  String trailer,
  bool done,
  String note,
}) =>
    serializers.toFirestore(
        ShowsRecord.serializer,
        ShowsRecord((s) => s
          ..name = name
          ..originalName = originalName
          ..country = country
          ..genre = genre
          ..ratingKinopoisk = ratingKinopoisk
          ..ratingImdb = ratingImdb
          ..description = description
          ..year = year
          ..image = image
          ..trailer = trailer
          ..done = done
          ..note = note));
