import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/outgoingactivitywrite.dart';

class OutGoingActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OutGoingActivityPageState();
}

class _OutGoingActivityPageState extends State<OutGoingActivityPage> {

  List<String> _needToFindCat = ['공학', '문학', '예술', '공모전','서포터즈'];
  String _selectedCat = '공학';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("대외활동 정보"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              isExpanded: true,
              items: _needToFindCat.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedCat(value),
              value: _selectedCat,
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('activity')
                  .where("category", isEqualTo: _selectedCat)
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
                                        document['content'],
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OutGoingActivityWritePage()));
        },
      ),
    );
  }

  void _onSelectedCat(String value){
    setState(() {
      _selectedCat = value;
    });
  }
}
