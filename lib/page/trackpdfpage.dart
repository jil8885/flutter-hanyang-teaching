import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/trackreviewpage.dart';
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
    switch (this.major) {
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
      appBar: AppBar(
        title: Text(this.major + " 전공 트랙"),
      ),
      body: InkWell(
        child: Center(
          child: PdfView(
            controller: pdfController,
          ),
        ),
        onTap: () {
          switch (major) {
            case '정보사회미디어학과':
              switch (pdfController.page) {
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("미디어저널리즘")));
                  break;
                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("데이터사이언스")));
                  break;
                case 4:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("사회문화콘텐츠")));
                  break;
              }
              break;
            case '재료화학공학과':
              switch (pdfController.page) {
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("유기.공정심화")));
                  break;
                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("무기소재심화")));
                  break;
                case 4:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("융합소재심화")));
                  break;
                case 5:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackReviewPage("재료화공통합")));
                  break;
              }
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          if (pdfController.page != pdfController.pagesCount) {
            pdfController.nextPage(
                duration: Duration(milliseconds: 20), curve: Curves.easeIn);
          } else {
            pdfController.animateToPage(1,
                duration: Duration(milliseconds: 250), curve: Curves.easeIn);
          }
        },
      ),
    );
  }
}
