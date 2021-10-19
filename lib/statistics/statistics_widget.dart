import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsWidget extends StatefulWidget {
  StatisticsWidget({Key key}) : super(key: key);

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        iconTheme: IconThemeData(color: Color(0xFF212121)),
        automaticallyImplyLeading: false,
        title: Text(
          'Statistics',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Montserrat',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF272727),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                labelColor: Color(0xFFFF4E00),
                unselectedLabelColor: Color(0xFF9E9E9E),
                labelStyle: GoogleFonts.getFont(
                  'Roboto',
                ),
                indicatorColor: Color(0xFFFF4E00),
                tabs: [
                  Tab(
                    text: 'Bar chart',
                    icon: Icon(
                      Icons.show_chart,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  Tab(
                    text: 'Notes',
                    icon: Icon(
                      Icons.comment,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  Tab(
                    text: 'Favourites',
                    icon: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Text(
                      'Tab View 1',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Tab View 2',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Tab View 3',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
