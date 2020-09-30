import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class TrackPDFPage extends StatefulWidget {
  TrackPDFPage(this.major);
  var major;
  @override
  _TrackPDFPageState createState() => new _TrackPDFPageState(major);
}

class _TrackPDFPageState extends State<TrackPDFPage> {
  _TrackPDFPageState(this.major);
  var major;

  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    switch(this.major){
      case "정보사회미디어학과":
        pathPDF = "flutter_assets/pdf/mi.pdf";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(pathPDF);
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}