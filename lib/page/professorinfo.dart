import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/model/info.dart';
import 'package:flutter_hanyang_teaching/model/professor.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfessorInfoPage extends StatefulWidget {
  ProfessorInfoPage(this.college, this.major);
  final college;
  final major;

  @override
  State<StatefulWidget> createState() => _ProfessorInfoPageState(this.college, this.major);

}

class _ProfessorInfoPageState extends State<ProfessorInfoPage>{
  _ProfessorInfoPageState(this.college, this.major);
  final String college;
  final String major;

  final InfoModel _infoModel = InfoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(major + " 교수진"),),
      body: _myListView(context, college, major),
    );
  }


  Widget _myListView(BuildContext context, String college, String major) {
    var professorInfo = _infoModel.getProfessorsByMajor(college, major);
    return ListView.builder(
      itemCount: professorInfo.length,
      itemBuilder: (context, index){
        var professor = Professor.fromJson(professorInfo[index]);
        return Card(
          child: ListTile(
            title: Text(professor.name),
            trailing: Icon(Icons.arrow_right),
            onTap: () async{
              await launch(professor.site, forceWebView: false, forceSafariVC: false);
            },
          ),
        );
      },);
  }
}

