import 'dart:async';
import 'dart:convert';

import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../films_page/films_page_widget.dart';
import '../../auth_page/auth_page_widget.dart';
import '../../registration_page/registration_page_widget.dart';
import '../../onboarding/onboarding_widget.dart';
import '../../current_film/current_film_widget.dart';
import '../../shows_page/shows_page_widget.dart';
import '../../games_page/games_page_widget.dart';
import '../../books_page/books_page_widget.dart';
import '../../affairs_page/affairs_page_widget.dart';
import '../../current_show/current_show_widget.dart';
import '../../current_game/current_game_widget.dart';
import '../../current_book/current_book_widget.dart';
import '../../current_affair/current_affair_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/Logo_MustLive_3.jpg',
              fit: BoxFit.fill,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'FilmsPage': (data) async => FilmsPageWidget(),
  'AuthPage': (data) async => AuthPageWidget(),
  'RegistrationPage': (data) async => RegistrationPageWidget(),
  'Onboarding': (data) async => OnboardingWidget(),
  'CurrentFilm': (data) async => CurrentFilmWidget(
        filmDetail: getParameter(data, 'filmDetail'),
      ),
  'ShowsPage': (data) async => ShowsPageWidget(
        doctor: getParameter(data, 'doctor'),
      ),
  'GamesPage': (data) async => GamesPageWidget(
        doctor: getParameter(data, 'doctor'),
      ),
  'BooksPage': (data) async => BooksPageWidget(),
  'AffairsPage': (data) async => AffairsPageWidget(
        doctor: getParameter(data, 'doctor'),
      ),
  'Statistics': (data) async => NavBarPage(initialPage: 'StatisticsWidget'),
  'Profile': (data) async => NavBarPage(initialPage: 'ProfileWidget'),
  'CurrentShow': (data) async => CurrentShowWidget(
        showDetails: getParameter(data, 'showDetails'),
      ),
  'CurrentGame': (data) async => CurrentGameWidget(
        gameDetail: getParameter(data, 'gameDetail'),
      ),
  'CurrentBook': (data) async => CurrentBookWidget(
        bookDetail: getParameter(data, 'bookDetail'),
      ),
  'CurrentAffair': (data) async => CurrentAffairWidget(
        affairDetail: getParameter(data, 'affairDetail'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return json.decode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

T getParameter<T>(Map<String, dynamic> data, String paramName) {
  try {
    if (!data.containsKey(paramName)) {
      return null;
    }
    final param = data[paramName];
    switch (T) {
      case String:
        return param;
      case double:
        return param.toDouble();
      case DateTime:
        return DateTime.fromMillisecondsSinceEpoch(param) as T;
      case LatLng:
        return latLngFromString(param) as T;
    }
    if (param is String) {
      return FirebaseFirestore.instance.doc(param) as T;
    }
    return param;
  } catch (e) {
    print('Error parsing parameter "$paramName": $e');
    return null;
  }
}

Future<T> getDocumentParameter<T>(
    Map<String, dynamic> data, String paramName, Serializer<T> serializer) {
  if (!data.containsKey(paramName)) {
    return null;
  }
  return FirebaseFirestore.instance
      .doc(data[paramName])
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));
}

final latRegex = RegExp(
    r'^(+|-)?(?:90(?:(?:.0{1,7})?)|(?:[0-9]|[1-8][0-9])(?:(?:.[0-9]{1,7})?))$');
final lngRegex = RegExp(
    r'^(+|-)?(?:180(?:(?:.0{1,7})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:.[0-9]{1,7})?))$');

LatLng latLngFromString(String latLngStr) {
  final pieces = latLngStr.split(',');
  if (pieces.length != 2) {
    return null;
  }
  final lat = pieces[0].trim();
  final lng = pieces[1].trim();
  if (!latRegex.hasMatch(lat)) {
    return null;
  }
  if (!lngRegex.hasMatch(lng)) {
    return null;
  }
  return LatLng(double.parse(lat), double.parse(lng));
}
