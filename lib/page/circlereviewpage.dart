import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/model/circle.dart';
import 'package:flutter_hanyang_teaching/page/circlereviewwrite.dart';
import 'package:flutter_hanyang_teaching/model/info.dart';
import 'package:intl/intl.dart';

class CircleReviewPage extends StatefulWidget {
  CircleReviewPage(this.college, this.major);
  final String major;
  final String college;
  @override
  State<StatefulWidget> createState() => _CircleReviewPageState(college, major);
}

class _CircleReviewPageState extends State<CircleReviewPage> {
  _CircleReviewPageState(this.college, this.major);
  final String major;
  final String college;

  String timestampToStrDateTime(Timestamp ts) {
    return DateFormat('yyyy-MM-dd\nHH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch))
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    final InfoModel _infoModel = InfoModel();
    List<dynamic> circles = _infoModel.getCirclesByMajor(college, major);
    Circle selectedCircle;
    return Scaffold(
      appBar: AppBar(
        title: Text("학회 정보 - " + major),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: DropdownButton<Circle>(
              hint: Text("Select item"),
              value: selectedCircle,
              onChanged: (Circle value) {
                setState(() {
                  selectedCircle = value;
                });
              },
              items: circles.map((item) {
                Circle circle = Circle.fromJson(item);
                return DropdownMenuItem<Circle>(
                  value: selectedCircle,
                  child: Text(circle.name),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('class')
                  .where("major", isEqualTo: major)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('조회된 정보가 없습니다');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: Text('로딩중입니다.'));
                  default:
                    return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        Timestamp ts = document['date'];
                        String dt = timestampToStrDateTime(ts);
                        return Card(
                          elevation: 2,
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        document['title'] +
                                            "(" +
                                            document["subject"] +
                                            ")",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dt.toString(),
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      document['content'],
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CircleReviewWritePage(major)));
        },
      ),
    );
  }
}
