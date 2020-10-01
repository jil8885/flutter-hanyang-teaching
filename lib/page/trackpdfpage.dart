import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';


class TrackPDFPage extends StatefulWidget {
  TrackPDFPage(this.major);
  final major;
  @override
  _TrackPDFPageState createState() => new _TrackPDFPageState(major);
}

class _TrackPDFPageState extends State<TrackPDFPage> {
  _TrackPDFPageState(this.major);
  var major;
  var pdfController;
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    switch(this.major){
      case "정보사회미디어학과":
        pathPDF = "pdf/mi.pdf";
        break;
      case "재료화학공학과":
        pathPDF = "pdf/mscheme.pdf";
        break;
    }
    pdfController = PdfController(document: PdfDocument.openAsset(pathPDF));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.major + " 전공 트랙"),),
      body: Center(child: PdfView(controller: pdfController,),),
    );
  }
}