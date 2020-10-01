import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/OutGoingActivityWrite.dart';

class OutGoingActivityPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OutGoingActivityPageState();
}

class _OutGoingActivityPageState extends State<OutGoingActivityPage>{
  bool engineeringVal = false;
  bool artVal = false;
  bool literatureVal = false;
  bool supportersVal = false;
  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              boolValue = value;
            });
          },
        )
      ],
    );
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
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OutGoingActivityWritePage()));},
      ),
    );
  }
}