import 'package:flutter_hanyang_teaching/model/college.dart';
import 'package:flutter_hanyang_teaching/model/major.dart';

class InfoModel{
  List<Map> getAllMajor() => _collegeInfo;

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
          "major": "소프트웨어학부"
        },
        {
          "major": "ICT 융합학부"
        }
      ]
    },
    {
      "college": "공학대학",
      "alias": "college_engineering",
      "majors": [
        {
          "major": "기계공학과"
        },
        {
          "major": "로봇공학과"
        },
        {
          "major": "산업경영공학과"
        },
        {
          "major": "전자공학부"
        },
        {
          "major": "재료화학공학과"
        },
        {
          "major": "생명나노공학과"
        },
        {
          "major": "건축학부"
        },
        {
          "major": "건설환경플랜트공학과"
        },
        {
          "major": "교통물류공학과"
        },
        {
          "major": "국방정보공학과"
        },
      ]
    },
    {
      "college": "언론정보대학",
      "alias": "college_information",
      "majors": [
        {
          "major": "정보사회미디어학과"
        },
        {
          "major": "광고홍보학과"
        },
      ]
    },
  ];
}