import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CircleReviewWritePage extends StatefulWidget {
  CircleReviewWritePage(this.major);
  final String major;
  @override
  State<StatefulWidget> createState() => _CircleReviewWritePageState(major);
}

class _CircleReviewWritePageState extends State<CircleReviewWritePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  _CircleReviewWritePageState(this.major);
  final String major;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("전공 과목 후기 작성"),
      ),
      body: Container(
        child: Column(
          children: [
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
            Container(
              height: 90,
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '과목',
                ),
                controller: _subjectController,
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
              _subjectController.text.isNotEmpty) {
            FirebaseFirestore.instance.collection('class').add({
              'major': major,
              'title': _titleController.text,
              'content': _contentController.text,
              'subject': _subjectController.text,
              'date': Timestamp.now(),
            });
            _titleController.clear();
            _contentController.clear();
            _subjectController.clear();
          }
        },
      ),
    );
  }
}
