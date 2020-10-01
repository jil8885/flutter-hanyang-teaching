import 'club.dart';
import 'clubcategory.dart';

class ClubInfoModel{
  List<Map> getAllMajor() => _collegeInfo;

  getClubsNamesByCategory(String category){
    var clubInCategory = _collegeInfo
        .map((e) => ClubCategory.fromJson(e))
        .where((element) => element.category == category)
        .map((element) => element.clubs)
        .expand((element) => element)
        .map((e) => Club.fromJson(e))
        .map((e) => e.name)
        .toList();
    return clubInCategory;
  }



  List<String> getCategory() => _collegeInfo
      .map((e) => ClubCategory.fromJson(e))
      .map((item) => item.category)
      .toList();

  List _collegeInfo = [
    {"category":"연행예술분과", "clubs":[{"name":"어우림"},{"name":"헤마"},{"name":"무삐"},{"name":"뭉게구름"},{"name":"하늬바람"},{"name":"파랑소래"},{"name":"미라클"},{"name":"DOH"},{"name":"살판"},{"name":"탈"},{"name":"필소굿"},]},
    {"category":"체육분과", "clubs":[{"name":"스카이 베가본드"},{"name":"풀쓰로틀"},{"name":"해동검도"},{"name":"스킨스쿠버"},{"name":"검우회"},{"name":"샷세"},{"name":"요트부"},{"name":"한양유술회"},{"name":"태극동"},{"name":"산악회"},]},
    {"category":"평면예술분과", "clubs":[{"name":"서예회"},{"name":"소나기"},{"name":"히이포커스"},{"name":"그림얼"},]},
    {"category":"학술분과", "clubs":[{"name":"알라"},{"name":"열끼"},{"name":"Cracker"},{"name":"KUSA"},{"name":"다물"},]},
    {"category":"구기체육분과", "clubs":[{"name":"탁우회"},{"name":"FC 한양"},{"name":"하이바"},{"name":"하이텍"},{"name":"하이클리어"},{"name":"타이푼"},]},
    {"category":"봉사분과", "clubs":[{"name":"호우회"},{"name":"후사"},{"name":"손말사랑회"},{"name":"로타렉트"},{"name":"황토"},]},
    {"category":"교양분과", "clubs":[{"name":"유스호스텔"},{"name":"기우회"},{"name":"하이코라"},{"name":"마티니"},{"name":"TIME"},{"name":"HAM"},]},
    {"category":"종교분과", "clubs":[{"name":"네비게이토"},{"name":"CAM"},{"name":"증산도"},{"name":"CSA"},{"name":"CCC"},{"name":"EBS"},{"name":"CBA"},{"name":"IVF"},]},
  ];
}