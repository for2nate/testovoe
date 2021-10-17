import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPageWidget extends StatefulWidget {
  RegistrationPageWidget({Key key}) : super(key: key);

  @override
  _RegistrationPageWidgetState createState() => _RegistrationPageWidgetState();
}

class _RegistrationPageWidgetState extends State<RegistrationPageWidget> {
  String dropDownValue;
  TextEditingController textFieldAboutMeController;
  TextEditingController textFieldEmailController;
  TextEditingController textFieldNameController;
  TextEditingController textFieldPhoneController;
  TextEditingController textFieldPasswordController;
  bool textFieldPasswordVisibility;
  TextEditingController textFieldPasswordConfirmController;
  bool textFieldPasswordConfirmVisibility;
  TextEditingController textFieldPriceController;
  bool switchListTileValue;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldAboutMeController = TextEditingController();
    textFieldEmailController = TextEditingController();
    textFieldNameController = TextEditingController();
    textFieldPhoneController = TextEditingController();
    textFieldPasswordController = TextEditingController();
    textFieldPasswordVisibility = false;
    textFieldPasswordConfirmController = TextEditingController();
    textFieldPasswordConfirmVisibility = false;
    textFieldPriceController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
              child: Text(
                'Регистрация',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            TextFormField(
              controller: textFieldNameController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                fontFamily: 'Poppins',
              ),
            ),
            TextFormField(
              controller: textFieldEmailController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: textFieldPhoneController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              controller: textFieldPasswordController,
              obscureText: !textFieldPasswordVisibility,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                    () => textFieldPasswordVisibility =
                        !textFieldPasswordVisibility,
                  ),
                  child: Icon(
                    textFieldPasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                ),
              ),
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            TextFormField(
              controller: textFieldPasswordConfirmController,
              obscureText: !textFieldPasswordConfirmVisibility,
              decoration: InputDecoration(
                hintText: 'Password Confirm',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                    () => textFieldPasswordConfirmVisibility =
                        !textFieldPasswordConfirmVisibility,
                  ),
                  child: Icon(
                    textFieldPasswordConfirmVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                ),
              ),
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            TextFormField(
              controller: textFieldPriceController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Price per hour',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            TextFormField(
              controller: textFieldAboutMeController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'About Me',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
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
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
              maxLines: 4,
            ),
            StreamBuilder<List<CategoriesRecord>>(
              stream: queryCategoriesRecord(),
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
                List<CategoriesRecord> dropDownCategoriesRecordList =
                    snapshot.data;
                return FlutterFlowDropDown(
                  options: ['Option 1'].toList(),
                  onChanged: (val) => setState(() => dropDownValue = val),
                  width: 130,
                  height: 40,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Colors.black,
                  borderWidth: 0,
                  borderRadius: 1,
                  margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                );
              },
            ),
            SwitchListTile(
              value: switchListTileValue ??= true,
              onChanged: (newValue) =>
                  setState(() => switchListTileValue = newValue),
              title: Text(
                'Вы доктор?',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                ),
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  if (textFieldPasswordController.text !=
                      textFieldPasswordConfirmController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Passwords don't match!",
                        ),
                      ),
                    );
                    return;
                  }

                  final user = await createAccountWithEmail(
                    context,
                    textFieldEmailController.text,
                    textFieldPasswordController.text,
                  );
                  if (user == null) {
                    return;
                  }

                  final usersCreateData = createUsersRecordData(
                    email: textFieldEmailController.text,
                    displayName: textFieldNameController.text,
                    createdTime: getCurrentTimestamp,
                    phoneNumber: textFieldPhoneController.text,
                    aboutMe: textFieldAboutMeController.text,
                    price: textFieldPriceController.text,
                    doctorIsFalse: switchListTileValue,
                    type: dropDownValue,
                  );
                  await UsersRecord.collection
                      .doc(user.uid)
                      .update(usersCreateData);

                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageWidget(),
                    ),
                    (r) => false,
                  );
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: 'Зарегистрироваться',
              options: FFButtonOptions(
                width: 130,
                height: 48,
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
              loading: _loadingButton,
            )
          ],
        ),
      ),
    );
  }
}
