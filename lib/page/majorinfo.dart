import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/classreviewpage.dart';
import 'package:flutter_hanyang_teaching/page/professorinfo.dart';
import 'package:flutter_hanyang_teaching/page/trackpdfpage.dart';

class MajorInfoPage extends StatefulWidget {
  MajorInfoPage(this.college, this.major);
  final String college;
  final String major;
  @override
  _MajorInfoPageState createState() => _MajorInfoPageState(college, major);
}

class _MajorInfoPageState extends State<MajorInfoPage> {
  _MajorInfoPageState(this.college, this.major);
  final String college;
  final String major;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          major,
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 40),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                createGridItem(
                    '전공 트랙', Colors.cyan, Icons.map, TrackPDFPage(major)),
                createGridItem('전공 수강평', Colors.deepPurple, Icons.class_,
                    ClassReviewPage(major)),
                createGridItem('교수님 연구분야', Colors.orange[300],
                    Icons.people_outline, ProfessorInfoPage(college, major)),
                createGridItem(
                    '학회 정보', Colors.pink, Icons.group, TrackPDFPage(major)),
                createGridItem('과 취업현황', Colors.teal[900], Icons.work,
                    TrackPDFPage(major)),
                createGridItem('선배와의 1대1 연락', Colors.green, Icons.phone,
                    TrackPDFPage(major)),
              ],
            ),
          )),
    );
  }

  Widget createGridItem(String title, Color color, IconData icon, Widget page) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Card(
            elevation: 10,
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                side: BorderSide(color: Colors.white)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 40,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
