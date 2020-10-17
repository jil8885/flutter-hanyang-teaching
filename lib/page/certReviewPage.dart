import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/model/info.dart';
import 'package:flutter_hanyang_teaching/page/majorinfo.dart';

import 'certReviewWrite.dart';

class CertPage extends StatefulWidget{
  @override
  _CertPageState createState() => _CertPageState();
}

class _CertPageState extends State<CertPage>{
  InfoModel _infoModel = InfoModel();
  List<String> _colleges = ["단과대학 선택"];
  List<String> _majors = ["학과 선택"];

  String _selectedCollege = "단과대학 선택";
  String _selectedMajor = "학과 선택";

  String _queryMajor = "공통";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('학과  선택'), elevation: 0.1,),
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                isExpanded: true,
                items: _colleges.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedCollege(value),
                value: _selectedCollege,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                isExpanded: true,
                items: _majors.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedMajor(value),
                value: _selectedMajor,
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('certs')
                    .where("name", isEqualTo: _queryMajor)
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
                          return Card(
                            elevation: 2,
                            child: InkWell(
                                child: Container(
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
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          document['paper'],
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          document['practice'],
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
                  builder: (context) => CertReviewWritePage(_queryMajor)));
        },
      ),
    );
  }

  @override
  void initState() {
    _colleges = List.from(_colleges)..addAll(_infoModel.getColleges());
    super.initState();
  }
  
  void _onSelectedCollege(String value){
    setState(() {
      if(value == "단과대학 선택"){
        _queryMajor = "공통";
      }
      _selectedMajor = '학과 선택';
      _majors = ['학과 선택'];
      _selectedCollege = value;
      _majors = List.from(_majors)..addAll(_infoModel.getMajorByCollege(value));
    });
  }

  void _onSelectedMajor(String value){
    setState(() {
      _selectedMajor = value;
      _queryMajor = value;
    });
  }
}