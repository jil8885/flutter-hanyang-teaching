import 'package:flutter/material.dart';

class OutGoingActivityWritePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OutGoingActivityWritePageState();
}

class _OutGoingActivityWritePageState extends State<OutGoingActivityWritePage>{
  var _categories = ["분야 선택..", "공학", "예술", "문학", "서포터즈"];
  var _selectedCategory = "분야 선택..";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("대외활동 후기 작성"),),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton(
                isExpanded: true,
                items: _categories.map(
                    (value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }
                ).toList(),
                value: _selectedCategory,
                onChanged: (value){
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ),
            Container(
              height: 90,
              padding: EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '제목',
                  )
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  maxLines: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '내용',
                  )
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
      ),
    );
  }
}