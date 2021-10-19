import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'affairs_record.g.dart';

abstract class AffairsRecord
    implements Built<AffairsRecord, AffairsRecordBuilder> {
  static Serializer<AffairsRecord> get serializer => _$affairsRecordSerializer;

  @nullable
  String get name;

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

  static void _initializeBuilder(AffairsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..image = ''
    ..done = false
    ..note = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('affairs');

  static Stream<AffairsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AffairsRecord._();
  factory AffairsRecord([void Function(AffairsRecordBuilder) updates]) =
      _$AffairsRecord;

  static AffairsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAffairsRecordData({
  String name,
  String description,
  String image,
  bool done,
  String note,
}) =>
    serializers.toFirestore(
        AffairsRecord.serializer,
        AffairsRecord((a) => a
          ..name = name
          ..description = description
          ..image = image
          ..done = done
          ..note = note));
