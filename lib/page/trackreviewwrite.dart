import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackReviewWritePage extends StatefulWidget {
  TrackReviewWritePage(this.major);
  final String major;
  @override
  State<StatefulWidget> createState() => _TrackReviewWritePageState(major);
}

class _TrackReviewWritePageState extends State<TrackReviewWritePage> {
  static var _moduleController = TextEditingController();
  static var _fieldController = TextEditingController();
  static var _inschoolController = TextEditingController();
  static var _outschoolController = TextEditingController();
  static var _certController = TextEditingController();
  static var _volunteerController = TextEditingController();
  static var _otherController = TextEditingController();

  static var _basicSubjectName = TextEditingController();
  static var _basicSubjectReason = TextEditingController();

  List<List<TextEditingController>> controllers = [
    [_basicSubjectName, _basicSubjectReason]
  ];
  _TrackReviewWritePageState(this.major);
  final String major;
  List<List<Widget>> list = [
    [
      Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '과목',
          ),
          controller: _basicSubjectName,
        ),
      ),
      Container(
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: TextField(
          minLines: null,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '이유',
          ),
          controller: _basicSubjectReason,
        ),
      ),
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("전공 모듈 후기 작성"),
        actions: [
          new IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (
                    // _moduleController.text.isNotEmpty &&
                    _fieldController.text.isNotEmpty &&
                        _inschoolController.text.isNotEmpty &&
                        _outschoolController.text.isNotEmpty &&
                        _certController.text.isNotEmpty &&
                        _volunteerController.text.isNotEmpty &&
                        _otherController.text.isNotEmpty &&
                        _basicSubjectName.text.isNotEmpty &&
                        _basicSubjectReason.text.isNotEmpty) {
                  List _subjectList = [];
                  controllers.forEach((element) {
                    if (element.elementAt(0).text.isNotEmpty &&
                        element.elementAt(1).text.isNotEmpty) {
                      _subjectList.add({
                        "name": element.elementAt(0).text,
                        "reason": element.elementAt(1).text
                      });
                    }
                  });
                  FirebaseFirestore.instance.collection('class').add({
                    'major': major,
                    'field': _fieldController.text,
                    'inschool': _inschoolController.text,
                    'outschool': _outschoolController.text,
                    'cert': _certController.text,
                    'volunteer': _volunteerController.text,
                    'others': _otherController.text,
                    'subjects': _subjectList,
                    'date': Timestamp.now(),
                  });
                  _fieldController.clear();
                  _inschoolController.clear();
                  _outschoolController.clear();
                  _certController.clear();
                  _volunteerController.clear();
                  _otherController.clear();
                  _basicSubjectName.clear();
                  _basicSubjectReason.clear();
                  controllers.forEach((element) {
                    element.elementAt(0).clear();
                    element.elementAt(1).clear();
                  });
                  list.clear();
                }
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // Container(
            //   height: 50,
            //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: '모듈',
            //     ),
            //     controller: _moduleController,
            //   ),
            // ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '세부분야',
                ),
                controller: _fieldController,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '교내 활동',
                ),
                controller: _inschoolController,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '대외 활동 및 공모전',
                ),
                controller: _outschoolController,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '자격증',
                ),
                controller: _certController,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '봉사활동',
                ),
                controller: _volunteerController,
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                minLines: null,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '기타사항',
                ),
                controller: _otherController,
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Widget subjectName = list.elementAt(index).elementAt(0);
                    Widget subjectReason = list.elementAt(index).elementAt(1);
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        subjectName,
                        subjectReason
                      ],
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var _tempController = TextEditingController();
          var _tempControllerReason = TextEditingController();
          controllers.add([_tempController, _tempControllerReason]);
          list.add([
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '과목',
                ),
                controller: _tempController,
              ),
            ),
            Container(
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextField(
                minLines: null,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이유',
                ),
                controller: _tempControllerReason,
              ),
            ),
          ]);
          setState(() {});
        },
      ),
    );
  }
}
