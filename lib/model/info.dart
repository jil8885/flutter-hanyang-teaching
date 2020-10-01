import 'package:flutter_hanyang_teaching/model/college.dart';
import 'package:flutter_hanyang_teaching/model/major.dart';

class InfoModel{
  List<Map> getAllMajor() => _collegeInfo;

  getProfessorsByMajor(String college, String major){
    var professorsInMajor = _collegeInfo
      .map((e) => College.fromJson(e))
      .where((element) => element.college == college)
      .map((e) => e.majors)
      .expand((element) => element)
      .map((e) => Major.fromJson(e))
      .map((e) => e.professors)
      .expand((element) => element)
      .toList();
    return professorsInMajor;
  }

  getMajorByCollege(String college){
    var majorInCollege =_collegeInfo
        .map((map) => College.fromJson(map))
        .where((element) => element.college == college)
        .map((element) => element.majors)
        .expand((element) => element)
        .map((e) => Major.fromJson(e))
        .map((e) => e.name)
        .toList();
    return majorInCollege;
  }


  List<String> getColleges() => _collegeInfo
      .map((e) => College.fromJson(e))
      .map((item) => item.college)
      .toList();

  List _collegeInfo = [
    {
      "college": "소프트웨어융합대학",
      "alias": "college_software",
      "majors": [
        {
          "major": "소프트웨어학부",
          "professors":[]
        },
        {
          "major": "ICT 융합학부",
          "professors":[],
        }
      ]
    },
    {
      "college": "공학대학",
      "alias": "college_engineering",
      "majors": [
        {
          "major": "기계공학과",
          "professors":[],
        },
        {
          "major": "로봇공학과",
          "professors":[],
        },
        {
          "major": "산업경영공학과",
          "professors":[],
        },
        {
          "major": "전자공학부",
          "professors":[],
        },
        {
          "major": "재료화학공학과",
          "professors":[
            {"name":"김우희", "subject":"", "site":"https://sites.google.com/view/hy-ace"},
            {"name":"김종렬", "subject":"", "site":"http://mcl.hanyang.ac.kr/"},
            {"name":"김종호", "subject":"", "site":"http://nanobiochem.hanyang.ac.kr/gnuboard4/main.php"},
            {"name":"김진경", "subject":"", "site":"https://www.smmdl.hanyang.ac.kr/"},
            {"name":"김태현", "subject":"", "site":"https://sites.google.com/view/biochemenglab/home"},
            {"name":"박주현", "subject":"", "site":"http://hitep2.hanyang.ac.kr/"},
            {"name":"유봉영", "subject":"", "site":"http://nmsl.hanyang.ac.kr/"},
            {"name":"안지훈", "subject":"", "site":"https://sites.google.com/site/nmdl1512"},
            {"name":"이선영", "subject":"", "site":"http://mfmd.hanyang.ac.kr/"},
            {"name":"이정호", "subject":"", "site":"http://mfmd.hanyang.ac.kr/"},
            {"name":"유효종", "subject":"", "site":"https://hjhaha73.wixsite.com/hyoogroup"},
            {"name":"이화성", "subject":"", "site":"https://www.oeslab.net/"},
            {"name":"조국영", "subject":"", "site":"http://fnmr.hanyang.ac.kr/"},
          ]
        },
        {
          "major": "생명나노공학과",
          "professors":[],
        },
        {
          "major": "건축학부",
          "professors":[],
        },
        {
          "major": "건설환경플랜트공학과",
          "professors":[],
        },
        {
          "major": "교통물류공학과",
          "professors":[],
        },
        {
          "major": "국방정보공학과",
          "professors":[],
        },
      ]
    },
    {
      "college": "언론정보대학",
      "alias": "college_information",
      "majors": [
        {
          "major": "정보사회미디어학과",
          "professors":[
            {"name":"우형진", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=20&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"김정기", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=19&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"윤영민", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=18&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"이종수", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=17&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"전범수", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=16&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"박성복", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=15&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"이창준", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=38&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
            {"name":"박조원", "subject":"", "site":"http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=14&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"},
          ],
        },
        {
          "major": "광고홍보학과",
          "professors":[],
        },
      ]
    },
  ];
}