import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/outgoingactivitywrite.dart';
import 'package:intl/intl.dart';

class OutGoingActivityPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OutGoingActivityPageState();
}

class _OutGoingActivityPageState extends State<OutGoingActivityPage>{
  bool engineeringVal = false;
  bool artVal = false;
  bool literatureVal = false;
  bool supportersVal = false;

  List<String> _needToFindCat = ['공학', '문학', '예술', '서포터즈'];
  String timestampToStrDateTime(Timestamp ts) {
    return DateFormat('yyyy-MM-dd\nHH:mm').format(DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("대외활동 정보"),),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("공학"),
                    Checkbox(
                      value: engineeringVal,
                      onChanged: (bool value) {
                        setState(() {
                          engineeringVal = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("문학"),
                    Checkbox(
                      value: literatureVal,
                      onChanged: (bool value) {
                        setState(() {
                          literatureVal = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("예술"),
                    Checkbox(
                      value: artVal,
                      onChanged: (bool value) {
                        setState(() {
                          artVal = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("서포터즈"),
                    Checkbox(
                      value: supportersVal,
                      onChanged: (bool value) {
                        setState(() {
                          supportersVal = value;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('activities').where("category", isEqualTo: "Art" ).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasError) return Text('조회된 정보가 없습니다');
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                        return Text('로딩중입니다.');
                      default:
                        return ListView(
                          children: snapshot.data.documents.map((DocumentSnapshot document) {
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(document['title'], style: TextStyle(color: Colors.blueGrey, fontSize: 17, fontWeight: FontWeight.bold,),),
                                          Text(dt.toString(), style: TextStyle(color: Colors.grey[600]),),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(document['category'], style: TextStyle(color: Colors.black54),),
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OutGoingActivityWritePage()));},
      ),
    );
  }
}