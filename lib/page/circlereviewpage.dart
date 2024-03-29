import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/model/info.dart';
import 'package:flutter_hanyang_teaching/page/circlereviewwrite.dart';
import 'package:intl/intl.dart';

class CircleReviewPage extends StatefulWidget{
  String major;
  String college;
  CircleReviewPage(this.college, this.major);
  @override
  _CircleReviewPageState createState() => _CircleReviewPageState(college, major);
}

class _CircleReviewPageState extends State<CircleReviewPage>{
  String major;
  String college;
  _CircleReviewPageState(this.college, this.major);

  InfoModel _infoModel = InfoModel();
  List<String> _circles = ["학회 선택"];
  List<String> _descriptions = ["학회를 선택해주세요."];
  String _selectedCircle = "학회 선택";
  String _selectedDescription;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('학과  선택'), elevation: 0.1,),
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true,
              items: _circles.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedCollege(value),
              value: _selectedCircle,
            ),
            Container(
              child: Card(
                elevation: 2,
                child: Text(_selectedDescription),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('circles')
                    .where("name", isEqualTo: _selectedCircle)
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
                                  height: 100,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            document['title'],
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            dt.toString(),
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          document['contents'],
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {}),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CircleReviewWritePage(_selectedCircle)));
        },
      ),
    );
  }

  @override
  void initState() {
    _circles = List.from(_circles)..addAll(_infoModel.getCirclesByMajor(college, major));
    _descriptions = List.from(_descriptions)..addAll(_infoModel.getCircleDescriptionByMajor(college, major));
    _selectedDescription = _descriptions.elementAt(0);
    super.initState();
  }

  void _onSelectedCollege(String value){
    setState(() {
      _selectedCircle = value;
      _selectedDescription = _descriptions.elementAt(_circles.indexOf(_selectedCircle));
    });
  }

  String timestampToStrDateTime(Timestamp ts) {
    return DateFormat('yyyy-MM-dd\nHH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch))
        .toString();
  }
}