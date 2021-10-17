import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../registration_page/registration_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatefulWidget {
  OnboardingWidget({Key key}) : super(key: key);

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  PageController pageViewController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
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
                        scrollDirection: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(1),
                              bottomRight: Radius.circular(1),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(1),
                            ),
                            child: Image.network(
                              'https://image.freepik.com/free-vector/onboarding-concept-illustration_114360-1085.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Image.network(
                            'https://www.videoproc.com/images/vp-seo/onboarding-video.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                            'http://thecorporatemagazine.com/wp-content/uploads/2021/01/Automated-Employee-Onboarding-the-future-of-HR.jpg',
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
                          axisDirection: Axis.horizontal,
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
            FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPageWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton,
            )
          ],
        ),
      ),
    );
  }
}
