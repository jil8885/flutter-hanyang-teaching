import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OutGoingActivityWritePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OutGoingActivityWritePageState();
}

class _OutGoingActivityWritePageState extends State<OutGoingActivityWritePage>{
  var _categories = ["분야 선택..", "공학", "예술", "문학", '공모전', "서포터즈"];
  var _selectedCategory = "분야 선택..";

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

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
                  ),
                controller: _titleController,
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
                  ),
                  controller: _contentController,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: (){
          if(_selectedCategory != '분야 선택..' && _titleController.text.isNotEmpty && _contentController.text.isNotEmpty){
            FirebaseFirestore.instance.collection('activity').add({
              'category': _selectedCategory,
              'title': _titleController.text,
              'content': _contentController.text,
              'date': Timestamp.now(),
            });
            _titleController.clear();
            _contentController.clear();
          }
        },
      ),
    );
  }
}