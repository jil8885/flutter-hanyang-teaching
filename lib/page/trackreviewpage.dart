import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanyang_teaching/page/trackreviewwrite.dart';
import 'package:intl/intl.dart';

class TrackReviewPage extends StatefulWidget {
  TrackReviewPage(this.major);
  final String major;
  @override
  State<StatefulWidget> createState() => _TrackReviewPageState(major);
}

class _TrackReviewPageState extends State<TrackReviewPage> {
  _TrackReviewPageState(this.major);
  final String major;

  bool engineeringVal = false;
  bool artVal = false;
  bool literatureVal = false;
  bool supportersVal = false;

  String timestampToStrDateTime(Timestamp ts) {
    return DateFormat('yyyy-MM-dd\nHH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch))
        .toString();
  }

  alertDialog(BuildContext context, String field, List subjects, String certs,
      String outschool, String inschool, String volunteer, String others) {
    // This is the ok button
    Widget ok = FlatButton(
      child: Text("Okay"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // show the alert dialog
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                    child: Column(
                      children: [
                        Text("모듈: " + major),
                        SizedBox(height: 30),
                        Text("분야: " + field),
                        SizedBox(height: 30),
                        Text("자격증: " + certs),
                        SizedBox(height: 30),
                        Text("교내활동"),
                        SizedBox(height: 10),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                inschool.split(",").elementAt(index).trim(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              );
                            },
                            itemCount: inschool.split(",").length,
                          ),
                        ),
                        Text("대외활동 및 공모전"),
                        SizedBox(height: 10),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                outschool.split(",").elementAt(index).trim(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              );
                            },
                            itemCount: outschool.split(",").length,
                          ),
                        ),
                        Text("봉사활동: " + volunteer),
                        SizedBox(height: 10),
                        Text("기타: " + others),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text("과목: " +
                                      subjects.elementAt(index)['name']),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    subjects
                                        .elementAt(index)['reason']
                                        .toString()
                                        .trim(),
                                    textAlign: TextAlign.start,
                                  )
                                ],
                              );
                            },
                            itemCount: subjects.length,
                          ),
                        ),
                      ],
                    ),
                    height: height - 100,
                    width: width - 20,
                  );
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var exampleField,
        exampleSubjects,
        exampleCerts,
        exampleOutschool,
        exampleInschool,
        exampleVolunteer,
        exampleOthers;
    switch (major) {
      case '미디어저널리즘':
        exampleField = "언론 계열 진출";
        exampleSubjects = [
          {
            'name': '매스커뮤니케이션론',
            'reason':
                '''연계도 : 미디어에 대해 구체적으로 분야들의 정보를 알 수 있게 강의가 지속되며 실질적으로 현재 미디어에서 찾아볼 수 있는 사례를 활용하여 이해가 쉽다\n
                중요하다고 생각하는 파트 : 전체적으로 다 중요하지만 sns의 사용 빈도가 높은 요즘, 소셜미디어, 미디어의 폭력성 선정성을 다룬 파트가 특히 중요해 보임\n
                교과목 팁 : 이 과목을 수강함으로써 미디어와 관련된 심화 된 강의를 더 쉽게 들을 수 있다'''
          },
          {
            'name': '온라인저널리즘',
            'reason':
                '''연계도 : 저널리즘에 대해 주로 배우며 특히 기자 쪽의 진로를 희망하는 사람들에게 필수적으로 추천\n\n중요하다고 생각하는 파트 : 기사 작성 등 기사에 대해 전반적인 내용들을 구체적으로 알아본다\n\n교과목 팁 : 글쓰기에 취약하고, 기자로의 진로희망이 없다면 비추'''
          },
        ];
        exampleCerts = "컴퓨터 활용능력시험";
        exampleOutschool = "롯데홈쇼핑 & 한국언론협회 공모전";
        exampleInschool = "학과 콘텐츠 학회 icon, 정보사회미디어학과 학술제 connection 참여";
        exampleVolunteer = '무';
        exampleOthers = "";
        break;
      case '데이터사이언스':
        exampleField = "데이터";
        exampleSubjects = [
          {
            'name': '데이터사이언스의이해',
            'reason':
                '''연계도 : 데이터사이언스의 발돋움을 할 수 있는 과목, 뿐만 아니라 심화과정을 위해 필수적으로 수강해야하는 파트\n\n중요하다고 생각하는 파트 : 데이터 (코딩) 를 다루는 능력\n\n교과목 팁 : 코딩이 버거운 사람들이 심화과목 이전 듣기 좋은 과목'''
          },
        ];
        exampleCerts = "컴퓨터 활용능력시험";
        exampleOutschool = "롯데홈쇼핑 & 한국언론협회 공모전";
        exampleInschool = "학과 콘텐츠 학회 icon, 정보사회미디어학과 학술제 connection 참여";
        exampleVolunteer = '무';
        exampleOthers = "";
        break;
      case '무기소재심화':
        exampleField = "철강";
        exampleSubjects = [
          {
            'name': '재료과학',
            'reason':
                '''연계도 : 분야와의 연계도 : 재료의 강도, 물질의 특성을 다루는 기초 학문\n\n중요하다고 생각되는 파트 : tensile strenth와 같은 강도 파트가 중요\n\n교과목 팁 :'''
          },
        ];
        exampleCerts = "";
        exampleOutschool =
            "1. 스틸유니버시티 코리아 챌린지 : 철강사 입사의 등용문이라고 불릴정도로 철강분야에서 유명한 대회, 철강 조업 시뮬레이션 모듈을 활용해 진행하며 가상의 조업 조건을 가지고 가장 효율적인 철강 제조 결과를 만들어내는 대회. 포스코";
        exampleInschool =
            "1. 패러글라이딩 중앙동아리 : 한달에 2~3회 장비를 빌려서 직접 활동하러 감. 회비는 5만원 정도로 다소 비쌀 수 있지만 동아리내에 장비가 있어 잘 참여한다면 재미있고 익사이팅한 체험을 할 수 있다.";
        exampleVolunteer =
            '1. 교내 한밀레 활동 : 교내 유학생들을 멘토처럼 서포터즈하는 활동으로 멘티가 연락이 안될 시 조금 힘들 수 있다.';
        exampleOthers = "■ 추가 팁 : 분야 특성상 여자가 거의 없는 남초분야.";
        break;
      default:
        exampleField = "테스트";
        exampleSubjects = [
          {'name': '과목1', 'reason': '''과목테스트'''},
        ];
        exampleCerts = "자격증 테스트";
        exampleOutschool = "대외활동 테스트";
        exampleInschool = "교내활동 테스트";
        exampleVolunteer = '무';
        exampleOthers = "";
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("수강평 정보 - " + major + ' 모듈'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 2,
            child: InkWell(
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          major,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "예시내용",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        exampleField,
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                alertDialog(
                    context,
                    exampleField,
                    exampleSubjects,
                    exampleCerts,
                    exampleOutschool,
                    exampleInschool,
                    exampleVolunteer,
                    exampleOthers);
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('class')
                  .where("major", isEqualTo: major)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('조회된 정보가 없습니다');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: Text('로딩중입니다.'));
                  default:
                    return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        Timestamp ts = document['date'];
                        String dt = timestampToStrDateTime(ts);
                        return Card(
                          elevation: 2,
                          child: InkWell(
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          document['major'],
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          dt.toString(),
                                          style: TextStyle(
                                              color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        document['field'],
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                alertDialog(
                                    context,
                                    document['field'],
                                    document['subjects'],
                                    document['cert'],
                                    document['outschool'],
                                    document['inschool'],
                                    document['volunteer'],
                                    document['others']);
                              }),
                        );
                      }).toList(),
                    );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TrackReviewWritePage(major)));
        },
      ),
    );
  }
}
