import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CircleReviewWritePage extends StatefulWidget {
  CircleReviewWritePage(this.name);
  final String name;
  @override
  State<StatefulWidget> createState() => _CircleReviewWritePageState(name);
}

class _CircleReviewWritePageState extends State<CircleReviewWritePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  _CircleReviewWritePageState(this.name);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("학회 후기 작성"),
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
            FirebaseFirestore.instance.collection('circles').add({
              'name': name,
              'title': _titleController.text,
              'contents': _contentController.text,
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
