import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/model/info.dart';
import 'package:flutter_hanyang_teaching/page/majorinfo.dart';

class MajorInfoStart extends StatefulWidget{
  @override
  _MajorInfoStartState createState() => _MajorInfoStartState();
}

class _MajorInfoStartState extends State<MajorInfoStart>{
  InfoModel _infoModel = InfoModel();
  List<String> _colleges = ["단과대학 선택"];
  List<String> _majors = ["학과 선택"];

  String _selectedCollege = "단과대학 선택";
  String _selectedMajor = "학과 선택";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('학과  선택'), elevation: 0.1,),
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true,
              items: _colleges.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedCollege(value),
              value: _selectedCollege,
            ),
            DropdownButton<String>(
              isExpanded: true,
              items: _majors.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedMajor(value),
              value: _selectedMajor,
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () {
                if(_selectedCollege == "단과대학 선택"){
                  showDialog(context: context, barrierDismissible: false,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('단과대학 미선택'),
                        content: Text('단과대학을 선택해주세요!'),
                        actions: [
                          FlatButton(child: Text('확인'), onPressed: (){Navigator.of(context).pop();},)
                        ],
                      );
                    });
                } else if(_selectedMajor == "학과 선택"){
                  showDialog(context: context, barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('전공 미선택'),
                          content: Text('전공을 선택해주세요!'),
                          actions: [
                            FlatButton(child: Text('확인'), onPressed: (){Navigator.of(context).pop();},)
                          ],
                        );
                      });
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MajorInfoPage(_selectedCollege, _selectedMajor)));
                }
              },
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text("학과 선택"),
            )
          ],
        ),
      ),),
    );
  }

  @override
  void initState() {
    _colleges = List.from(_colleges)..addAll(_infoModel.getColleges());
    super.initState();
  }
  
  void _onSelectedCollege(String value){
    setState(() {
      _selectedMajor = '학과 선택';
      _majors = ['학과 선택'];
      _selectedCollege = value;
      _majors = List.from(_majors)..addAll(_infoModel.getMajorByCollege(value));
    });
  }

  void _onSelectedMajor(String value){
    setState(() {
      _selectedMajor = value;
    });
  }
}