import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/majorinfostart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,  title: Text("한양대 ERICA 학과별 정보 앱", textAlign: TextAlign.center,),),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GridView.count(
              crossAxisCount: 2,
              children: [
                createGridItem('학과게시판', Colors.cyan, Icons.dashboard, MajorInfoStart()),
                createGridItem('대외활동', Colors.deepPurple, Icons.local_activity, MajorInfoStart()),
                createGridItem('중앙동아리', Colors.orange[300], Icons.group, MajorInfoStart()),
                createGridItem('자격증', Colors.pink, Icons.credit_card, MajorInfoStart()),
                createGridItem('교양', Colors.teal[900], Icons.list, MajorInfoStart()),
              ],
          ),
        )
      ),

    );
  }

  Widget createGridItem(String title, Color color, IconData icon, Widget page) {

    return Builder(builder: (context){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Card(
          elevation: 10,
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Colors.white)
          ),
          child: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => page));},
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 40, color: Colors.white,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title, style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },);
  }
}