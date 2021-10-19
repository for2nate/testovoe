import '../backend/backend.dart';
import '../films_page/films_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentAffairWidget extends StatefulWidget {
  CurrentAffairWidget({
    Key key,
    this.affairDetail,
  }) : super(key: key);

  final DocumentReference affairDetail;

  @override
  _CurrentAffairWidgetState createState() => _CurrentAffairWidgetState();
}

class _CurrentAffairWidgetState extends State<CurrentAffairWidget> {
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
    return StreamBuilder<AffairsRecord>(
      stream: AffairsRecord.getDocument(widget.affairDetail),
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
        final currentAffairAffairsRecord = snapshot.data;
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
                    builder: (context) => FilmsPageWidget(),
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
              currentAffairAffairsRecord.name,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFF212121),
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        currentAffairAffairsRecord.image,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Icon(
                          Icons.favorite_border,
                          color: Color(0xFFFF0000),
                          size: 45,
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          value: switchListTileValue ??= true,
                          onChanged: (newValue) =>
                              setState(() => switchListTileValue = newValue),
                          title: Text(
                            'Done',
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                            ),
                          ),
                          tileColor: Color(0xFF212121),
                          activeColor: Color(0xFFFF7500),
                          activeTrackColor: Color(0xFF302F2F),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                    color: Color(0xFF9E9E9E),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Name: ${currentAffairAffairsRecord.name}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Description: ${currentAffairAffairsRecord.description}',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: TextFormField(
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Notes',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF212121),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF212121),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF212121),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: FaIcon(
                          FontAwesomeIcons.pencilAlt,
                          color: Color(0xFF212121),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF212121),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
