import '../backend/backend.dart';
import '../doctor_page/doctor_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController textFieldSearchController;
  bool _loadingButton = false;
  double ratingBarValue = ratingBarReviewsRecord.grade;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Главная',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: textFieldSearchController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Поиск',
              hintStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFFD3D3D3),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFD3D3D3),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFD3D3D3),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFFD3D3D3),
              ),
            ),
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 15),
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('doctor_isFalse', isEqualTo: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> listViewUsersRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUsersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewUsersRecord =
                          listViewUsersRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    listViewUsersRecord.photoUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 8, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Dr. ${listViewUsersRecord.displayName}',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
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
                                            listViewUsersRecord.type,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              StreamBuilder<ReviewsRecord>(
                                                stream:
                                                    ReviewsRecord.getDocument(
                                                        listViewUsersRecord
                                                            .grade),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final ratingBarReviewsRecord =
                                                      snapshot.data;
                                                  return RatingBar.builder(
                                                    onRatingUpdate:
                                                        (newValue) => setState(
                                                            () =>
                                                                ratingBarValue =
                                                                    newValue),
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star_rounded,
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                    ),
                                                    direction: Axis.horizontal,
                                                    initialRating:
                                                        ratingBarReviewsRecord
                                                            .grade,
                                                    unratedColor:
                                                        Color(0xFF9E9E9E),
                                                    itemCount: 5,
                                                    itemSize: 12,
                                                    glowColor: FlutterFlowTheme
                                                        .secondaryColor,
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  listViewUsersRecord.price,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() =>
                                                    _loadingButton = true);
                                                try {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorPageWidget(
                                                        doctor:
                                                            listViewUsersRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  );
                                                } finally {
                                                  setState(() =>
                                                      _loadingButton = false);
                                                }
                                              },
                                              text: 'Book now',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 28,
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 16,
                                              ),
                                              loading: _loadingButton,
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
  }
}
