import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'books_record.g.dart';

abstract class BooksRecord implements Built<BooksRecord, BooksRecordBuilder> {
  static Serializer<BooksRecord> get serializer => _$booksRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get autor;

  @nullable
  String get description;

  @nullable
  String get image;

  @nullable
  bool get done;

  @nullable
  String get note;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BooksRecordBuilder builder) => builder
    ..name = ''
    ..autor = ''
    ..description = ''
    ..image = ''
    ..done = false
    ..note = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BooksRecord._();
  factory BooksRecord([void Function(BooksRecordBuilder) updates]) =
      _$BooksRecord;

  static BooksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBooksRecordData({
  String name,
  String autor,
  String description,
  String image,
  bool done,
  String note,
}) =>
    serializers.toFirestore(
        BooksRecord.serializer,
        BooksRecord((b) => b
          ..name = name
          ..autor = autor
          ..description = description
          ..image = image
          ..done = done
          ..note = note));
