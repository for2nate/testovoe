import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reviews_record.g.dart';

abstract class ReviewsRecord
    implements Built<ReviewsRecord, ReviewsRecordBuilder> {
  static Serializer<ReviewsRecord> get serializer => _$reviewsRecordSerializer;

  @nullable
  double get grade;

  @nullable
  String get review;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'review_for')
  DocumentReference get reviewFor;

  @nullable
  @BuiltValueField(wireName: 'schedule_for')
  DocumentReference get scheduleFor;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReviewsRecordBuilder builder) => builder
    ..grade = 0.0
    ..review = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReviewsRecord._();
  factory ReviewsRecord([void Function(ReviewsRecordBuilder) updates]) =
      _$ReviewsRecord;

  static ReviewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReviewsRecordData({
  double grade,
  String review,
  DocumentReference createdBy,
  DateTime createdAt,
  DocumentReference reviewFor,
  DocumentReference scheduleFor,
}) =>
    serializers.toFirestore(
        ReviewsRecord.serializer,
        ReviewsRecord((r) => r
          ..grade = grade
          ..review = review
          ..createdBy = createdBy
          ..createdAt = createdAt
          ..reviewFor = reviewFor
          ..scheduleFor = scheduleFor));
