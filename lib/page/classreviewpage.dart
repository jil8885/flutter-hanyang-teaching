import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/classreviewwrite.dart';
import 'package:intl/intl.dart';

class ClassReviewPage extends StatefulWidget {
  ClassReviewPage(this.major);
  final String major;
  @override
  State<StatefulWidget> createState() => _ClassReviewPageState(major);
}

class _ClassReviewPageState extends State<ClassReviewPage> {
  _ClassReviewPageState(this.major);
  final String major;

  bool engineeringVal = false;
  bool artVal = false;
  bool literatureVal = false;
  bool supportersVal = false;

  String timestampToStrDateTime(Timestamp ts) {
    return DateFormat('yyyy-MM-dd\nHH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch))
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수강평 정보 - " + major),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('class')
              .where("major", isEqualTo: major)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('조회된 정보가 없습니다');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: Text('로딩중입니다.'));
              default:
                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
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
                                    style: TextStyle(color: Colors.grey[600]),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClassReviewWritePage(major)));
        },
      ),
    );
  }
}
