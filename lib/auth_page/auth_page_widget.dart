import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../registration_page/registration_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPageWidget extends StatefulWidget {
  AuthPageWidget({Key key}) : super(key: key);

  @override
  _AuthPageWidgetState createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  'https://picsum.photos/seed/512/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Войти',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                TextFormField(
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Войти',
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
                      borderRadius: 8,
                    ),
                    loading: _loadingButton1,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: 230,
                      height: 44,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() => _loadingButton2 = true);
                                try {
                                  final user = await signInWithGoogle(context);
                                  if (user == null) {
                                    return;
                                  }
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                    (r) => false,
                                  );
                                } finally {
                                  setState(() => _loadingButton2 = false);
                                }
                              },
                              text: 'Sign in with Google',
                              icon: Icon(
                                Icons.add,
                                color: Colors.transparent,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: 230,
                                height: 44,
                                color: Colors.white,
                                textStyle: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Color(0xFF606060),
                                  fontSize: 17,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: 12,
                              ),
                              loading: _loadingButton2,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.83, 0),
                            child: Container(
                              width: 22,
                              height: 22,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                isAndroid
                    ? Container()
                    : Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton3 = true);
                              try {
                                final user = await signInWithApple(context);
                                if (user == null) {
                                  return;
                                }
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageWidget(),
                                  ),
                                  (r) => false,
                                );
                              } finally {
                                setState(() => _loadingButton3 = false);
                              }
                            },
                            text: 'Sign in with Apple',
                            icon: FaIcon(
                              FontAwesomeIcons.apple,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 230,
                              height: 44,
                              color: Colors.white,
                              textStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.black,
                                fontSize: 17,
                              ),
                              elevation: 4,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: 12,
                            ),
                            loading: _loadingButton3,
                          ),
                        ),
                      ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                    child: Container(
                      width: 230,
                      height: 44,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() => _loadingButton4 = true);
                                try {
                                  final user =
                                      await signInWithFacebook(context);
                                  if (user == null) {
                                    return;
                                  }
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageWidget(),
                                    ),
                                    (r) => false,
                                  );
                                } finally {
                                  setState(() => _loadingButton4 = false);
                                }
                              },
                              text: 'Login with Facebook',
                              icon: Icon(
                                Icons.add,
                                color: Colors.transparent,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: 230,
                                height: 44,
                                color: Colors.white,
                                textStyle: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Color(0xFF1877F2),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: 12,
                              ),
                              loading: _loadingButton4,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.83, 0),
                            child: Container(
                              width: 22,
                              height: 22,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPageWidget(),
                        ),
                      );
                    },
                    child: Text(
                      'Зарегистрироваться',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
