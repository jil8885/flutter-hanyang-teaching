import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CertReviewWritePage extends StatefulWidget {
  CertReviewWritePage(this.name);
  final String name;
  @override
  State<StatefulWidget> createState() => _CertReviewWritePageState(name);
}

class _CertReviewWritePageState extends State<CertReviewWritePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentPaperController = TextEditingController();
  TextEditingController _contentPracticeController = TextEditingController();
  _CertReviewWritePageState(this.name);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("자격증 후기 작성"),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                height: 350,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '필기 후기',
                    ),
                    controller: _contentPaperController,
                  ),
                ),
              ),
              Container(
                height: 350,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '실기 후기',
                    ),
                    controller: _contentPracticeController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          if (_titleController.text.isNotEmpty &&
              _contentPaperController.text.isNotEmpty &&
              _contentPracticeController.text.isNotEmpty
          ) {
            FirebaseFirestore.instance.collection('certs').add({
              'name': name,
              'title': _titleController.text,
              'paper': _contentPaperController.text,
              'practice': _contentPracticeController.text
            });
            _titleController.clear();
            _contentPaperController.clear();
            _contentPracticeController.clear();
          }
        },
      ),
    );
  }
}
