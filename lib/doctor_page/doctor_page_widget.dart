import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DoctorPageWidget extends StatefulWidget {
  DoctorPageWidget({
    Key key,
    this.doctor,
  }) : super(key: key);

  final DocumentReference doctor;

  @override
  _DoctorPageWidgetState createState() => _DoctorPageWidgetState();
}

class _DoctorPageWidgetState extends State<DoctorPageWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.doctor),
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
        final doctorPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: 500,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: PageView(
                      controller: pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.vertical,
                      children: [
                        Image.network(
                          'https://picsum.photos/seed/309/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          'https://picsum.photos/seed/102/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          'https://picsum.photos/seed/777/600',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: SmoothPageIndicator(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        count: 3,
                        axisDirection: Axis.vertical,
                        onDotClicked: (i) {
                          pageViewController.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: ExpandingDotsEffect(
                          expansionFactor: 2,
                          spacing: 8,
                          radius: 16,
                          dotWidth: 16,
                          dotHeight: 16,
                          dotColor: Color(0xFF9E9E9E),
                          activeDotColor: Color(0xFF3F51B5),
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
