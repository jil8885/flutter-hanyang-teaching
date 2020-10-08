import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/clubreviewwritepage.dart';
import 'package:intl/intl.dart';

class ClubReviewPage extends StatefulWidget {
  final String clubName;
  ClubReviewPage(this.clubName);
  @override
  State<StatefulWidget> createState() => _ClubReviewPageState(clubName);
}

class _ClubReviewPageState extends State<ClubReviewPage> {
  final String clubName;
  _ClubReviewPageState(this.clubName);

  String timestampToStrDateTime(Timestamp ts) {
    return DateFormat('yyyy-MM-dd\nHH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch))
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("동아리 정보"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('club')
              .where("name", isEqualTo: clubName)
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
                                    document['name'] +
                                        "(" +
                                        document["title"] +
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
                  builder: (context) => ClubReviewWritePage(clubName)));
        },
      ),
    );
  }
}
