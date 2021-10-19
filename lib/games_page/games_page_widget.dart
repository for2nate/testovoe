import '../backend/backend.dart';
import '../current_game/current_game_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GamesPageWidget extends StatefulWidget {
  GamesPageWidget({
    Key key,
    this.doctor,
  }) : super(key: key);

  final DocumentReference doctor;

  @override
  _GamesPageWidgetState createState() => _GamesPageWidgetState();
}

class _GamesPageWidgetState extends State<GamesPageWidget> {
  TextEditingController textController;
  bool switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GamesRecord>>(
      stream: queryGamesRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFadingCircle(
                color: Color(0xFFFF4E00),
                size: 50,
              ),
            ),
          );
        }
        List<GamesRecord> gamesPageGamesRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF212121),
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'HomePage'),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
            title: Text(
              'Games',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFF212121),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF212121),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF212121),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF212121),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 20),
                  child: StreamBuilder<List<GamesRecord>>(
                    stream: queryGamesRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitFadingCircle(
                              color: Color(0xFFFF4E00),
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<GamesRecord> listViewGamesRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewGamesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewGamesRecord =
                              listViewGamesRecordList[listViewIndex];
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CurrentGameWidget(
                                    gameDetail: listViewGamesRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFF272727),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            listViewGamesRecord.image,
                                            width: 90,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 8, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    listViewGamesRecord.name,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewGamesRecord.year,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.favorite_border,
                                                    color: Color(0xFFFF0000),
                                                    size: 24,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                listViewGamesRecord.platform,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                listViewGamesRecord.genre,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                listViewGamesRecord.year,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                child: SwitchListTile(
                                                  value: switchListTileValue ??=
                                                      true,
                                                  onChanged: (newValue) =>
                                                      setState(() =>
                                                          switchListTileValue =
                                                              newValue),
                                                  title: Text(
                                                    'Выполнено',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  tileColor: Color(0xFF272727),
                                                  activeColor:
                                                      Color(0xFFFF7500),
                                                  activeTrackColor:
                                                      Color(0xFF9E9E9E),
                                                  dense: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
