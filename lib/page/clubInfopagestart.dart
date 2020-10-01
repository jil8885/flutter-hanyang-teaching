import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/model/clubinfo.dart';

class ClubInfoPage extends StatefulWidget{
  @override
  _ClubInfoPageState createState() => _ClubInfoPageState();
}

class _ClubInfoPageState extends State<ClubInfoPage>{
  ClubInfoModel _infoModel = ClubInfoModel();
  List<String> _categories = ["분과 선택"];
  List<String> _clubs = ["동아리 선택"];

  String _selectedCategory = "분과 선택";
  String _selectedClub = "동아리 선택";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('동아리  선택'), elevation: 0.1,),
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true,
              items: _categories.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedCategory(value),
              value: _selectedCategory,
            ),
            DropdownButton<String>(
              isExpanded: true,
              items: _clubs.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedClub(value),
              value: _selectedClub,
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () {
                if(_selectedCategory == "분과 선택"){
                  showDialog(context: context, barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('분과 미선택'),
                          content: Text('분과를 선택해주세요!'),
                          actions: [
                            FlatButton(child: Text('확인'), onPressed: (){Navigator.of(context).pop();},)
                          ],
                        );
                      });
                } else if(_selectedClub == "동아리 선택"){
                  showDialog(context: context, barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('동아리 미선택'),
                          content: Text('동아리를 선택해주세요!'),
                          actions: [
                            FlatButton(child: Text('확인'), onPressed: (){Navigator.of(context).pop();},)
                          ],
                        );
                      });
                } else {
                }
              },
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text("동아리 선택"),
            )
          ],
        ),
      ),),
    );
  }

  @override
  void initState() {
    _categories = List.from(_categories)..addAll(_infoModel.getCategory());
    super.initState();
  }

  void _onSelectedCategory(String value){
    setState(() {
      _selectedClub = '동아리 선택';
      _clubs = ['동아리 선택'];
      _selectedCategory = value;
      _clubs = List.from(_clubs)..addAll(_infoModel.getClubsNamesByCategory(_selectedCategory));
    });
  }

  void _onSelectedClub(String value){
    setState(() {
      _selectedClub = value;
    });
  }
}