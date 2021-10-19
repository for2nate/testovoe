import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'films_record.g.dart';

abstract class FilmsRecord implements Built<FilmsRecord, FilmsRecordBuilder> {
  static Serializer<FilmsRecord> get serializer => _$filmsRecordSerializer;

  @nullable
  String get country;

  @nullable
  String get description;

  @nullable
  String get genre;

  @nullable
  String get image;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'original_name')
  String get originalName;

  @nullable
  @BuiltValueField(wireName: 'rating_imdb')
  String get ratingImdb;

  @nullable
  @BuiltValueField(wireName: 'rating_kinopoisk')
  String get ratingKinopoisk;

  @nullable
  String get trailer;

  @nullable
  String get year;

  @nullable
  bool get done;

  @nullable
  String get note;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FilmsRecordBuilder builder) => builder
    ..country = ''
    ..description = ''
    ..genre = ''
    ..image = ''
    ..name = ''
    ..originalName = ''
    ..ratingImdb = ''
    ..ratingKinopoisk = ''
    ..trailer = ''
    ..year = ''
    ..done = false
    ..note = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('films');

  static Stream<FilmsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FilmsRecord._();
  factory FilmsRecord([void Function(FilmsRecordBuilder) updates]) =
      _$FilmsRecord;

  static FilmsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFilmsRecordData({
  String country,
  String description,
  String genre,
  String image,
  String name,
  String originalName,
  String ratingImdb,
  String ratingKinopoisk,
  String trailer,
  String year,
  bool done,
  String note,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        FilmsRecord.serializer,
        FilmsRecord((f) => f
          ..country = country
          ..description = description
          ..genre = genre
          ..image = image
          ..name = name
          ..originalName = originalName
          ..ratingImdb = ratingImdb
          ..ratingKinopoisk = ratingKinopoisk
          ..trailer = trailer
          ..year = year
          ..done = done
          ..note = note
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
