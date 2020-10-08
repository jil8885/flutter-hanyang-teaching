import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommonClassReviewWritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommonClassReviewWritePageState();
}

class _CommonClassReviewWritePageState
    extends State<CommonClassReviewWritePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  var _selectedClass = "과목 선택..";

  void _onSelectedClass(String value) {
    setState(() {
      _selectedClass = value;
    });
  }

  List<String> _subjects = ['과목 선택..', '스페인어', '기계비평', '과학 기술의 철학적 이해'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("교양 과목 후기 작성"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButton<String>(
                isExpanded: true,
                items: _subjects.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedClass(value),
                value: _selectedClass,
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
        onPressed: () {
          if (_titleController.text.isNotEmpty &&
              _contentController.text.isNotEmpty &&
              _selectedClass != "과목 선택..") {
            FirebaseFirestore.instance.collection('class').add({
              'major': "common",
              'title': _titleController.text,
              'content': _contentController.text,
              'subject': _selectedClass,
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
