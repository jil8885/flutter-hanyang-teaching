import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClubReviewWritePage extends StatefulWidget {
  final String clubName;
  ClubReviewWritePage(this.clubName);
  @override
  State<StatefulWidget> createState() => _ClubReviewWritePageState(clubName);
}

class _ClubReviewWritePageState extends State<ClubReviewWritePage> {
  final String clubName;
  _ClubReviewWritePageState(this.clubName);

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

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
              _contentController.text.isNotEmpty) {
            FirebaseFirestore.instance.collection('club').add({
              'name': clubName,
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
