import 'package:flutter_hanyang_teaching/model/college.dart';
import 'package:flutter_hanyang_teaching/model/major.dart';
import 'package:flutter_hanyang_teaching/model/circle.dart';

class InfoModel {
  List<Map> getAllMajor() => _collegeInfo;

  getProfessorsByMajor(String college, String major) {
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

  getCirclesByMajor(String college, String major) {
    var circlesInMajor = _collegeInfo
        .map((e) => College.fromJson(e))
        .where((element) => element.college == college)
        .map((e) => e.majors)
        .expand((element) => element)
        .map((e) => Major.fromJson(e))
        .where((element) => element.name == major)
        .map((e) => e.circles)
        .expand((element) => element)
        .map((e) => Circle.fromJson(e))
        .map((e) => e.name)
        .toList();
    return circlesInMajor;
  }

  getCircleDescriptionByMajor(String college, String major) {
    var circlesInMajor = _collegeInfo
        .map((e) => College.fromJson(e))
        .where((element) => element.college == college)
        .map((e) => e.majors)
        .expand((element) => element)
        .map((e) => Major.fromJson(e))
        .where((element) => element.name == major)
        .map((e) => e.circles)
        .expand((element) => element)
        .map((e) => Circle.fromJson(e))
        .map((e) => e.description)
        .toList();
    return circlesInMajor;
  }

  getMajorByCollege(String college) {
    var majorInCollege = _collegeInfo
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
        {"major": "소프트웨어학부", "professors": []},
        {
          "major": "ICT 융합학부",
          "professors": [],
        }
      ]
    },
    {
      "college": "공학대학",
      "alias": "college_engineering",
      "majors": [
        {
          "major": "기계공학과",
          "professors": [],
        },
        {
          "major": "로봇공학과",
          "professors": [],
        },
        {
          "major": "산업경영공학과",
          "professors": [],
        },
        {
          "major": "전자공학부",
          "professors": [],
        },
        {
          "major": "재료화학공학과",
          "professors": [
            {
              "name": "김우희",
              "subject": "",
              "site": "https://sites.google.com/view/hy-ace"
            },
            {"name": "김종렬", "subject": "", "site": "http://mcl.hanyang.ac.kr/"},
            {
              "name": "김종호",
              "subject": "",
              "site": "http://nanobiochem.hanyang.ac.kr/gnuboard4/main.php"
            },
            {
              "name": "김진경",
              "subject": "",
              "site": "https://www.smmdl.hanyang.ac.kr/"
            },
            {
              "name": "김태현",
              "subject": "",
              "site": "https://sites.google.com/view/biochemenglab/home"
            },
            {
              "name": "박주현",
              "subject": "",
              "site": "http://hitep2.hanyang.ac.kr/"
            },
            {
              "name": "유봉영",
              "subject": "",
              "site": "http://nmsl.hanyang.ac.kr/"
            },
            {
              "name": "안지훈",
              "subject": "",
              "site": "https://sites.google.com/site/nmdl1512"
            },
            {
              "name": "이선영",
              "subject": "",
              "site": "http://mfmd.hanyang.ac.kr/"
            },
            {
              "name": "이정호",
              "subject": "",
              "site": "http://mfmd.hanyang.ac.kr/"
            },
            {
              "name": "유효종",
              "subject": "",
              "site": "https://hjhaha73.wixsite.com/hyoogroup"
            },
            {"name": "이화성", "subject": "", "site": "https://www.oeslab.net/"},
            {
              "name": "조국영",
              "subject": "",
              "site": "http://fnmr.hanyang.ac.kr/"
            },
          ],
          "circles": [
            {
              "name": "HYACE",
              "description":
                  "2009년 화학공학과 전공학회로 출발한 HYACE는 가장 오랜 기간 지속되고 있는 유일한 전공 관련 학회입니다. ‘HanYang Advanced Chemical Engineers’라는 이름에 어울릴 수 있도록 다양한 활동으로 강의수업 외에 대중 앞에서의 프레젠테이션 기회와 학회 회원들과의 브레인스토밍, 그리고 공모전 출전 및 친목활동을 중심으로 운영되고 있습니다. 특히 매년 한국 화학공학회에서 주최하는 공모전에 출전하여 수상경력을 이어오고 있습니다."
            },
            {
              "name": "RUN & GUN",
              "description":
                  "Run&Gun은 2014년 설립된 재료공학과 & 화학공학과 최초 통합 학회로 농구에 대한 꿈이 있는 자들의 노력과 열정의 mgSinθ, 포기를 모르는 사람들의 근성으로 매주 모여 농구도하며 스터디를 통해 선후배간의 돈독한 유대를 주고받는 학회입니다. 농구를 처음 접해보는 학우들 남녀노소 누구나 가입할 수 있으며, 교본과 동영상이 홈페이지에 마련되어있어 기초를 다져 실력을 쌓는 과정을 거친 학우들이 많습니다. 사회와 대학원으로 먼저 진출하신 선배님들과도 함께하는 시간을 가져 후배들에게 도움이 되는 조언과 노하우를 전수해 주시거나 또한 매년 교내·외 및 Run&Gun 자체대회를 시행하여 우리들의 노력의 결과로 자신감과 사랑을 얻어갈 수 있는 가족 같은 학회입니다."
            },
            {
              "name": "기지개",
              "description":
                  "기지개는 민중가요라는 장르에 맞춰 춤을 추는 학회입니다. 춤이라고는 하지만 율동에 더 가까운 동작들 이기 때문에 남녀노소 모두 배우기도 쉽고 보는 사람들로 하여 귀엽다라는 느낌을 받을 수 있습니다. 그렇다고 기지개가 민중가요에 맞는 귀여운 율동만을 하는 것이 아니라 때로는 강렬한 춤도 추고, 우리가 흔히 듣는 대중가요의 춤을 추기도 합니다. 또한 기지개는 현재 21기 까지 있을 정도로 오래되고 위에 선배들과도 돈독한 사이를 유지하고 있기 때문에 때때로 대학원에 진학한 선배들과 현재 취업을 하신 선배들로 부터 조언을 받거나 졸업후의 진로에 대해서 상담을 받을 수 있습니다. 기지개는 1년에 총 3번의 공연이 진행이 되는데 첫번째로는 기지개, 아우성, 수리패 3학회가 같이 하는 연합공연이라는 것이 있고, 학교 내에서 홍보를 하여 하는 정기공연, 마지막으로 선배들을 초청해서 하는 창립제가 있습니다. 연합공연을 통하여 아우성, 수리패와 같이 다른학회들과도 돈독한 사이를 유지할 뿐만 아니라 기지개 공연 연습을 하면서 기지개 사이에서도 정말 가족같은 사이를 유지하며 다같이 소풍도 가는등 많은 활동을 하고 있습니다."
            },
            {
              "name": "세레모니",
              "description":
                  "세레모니는 재료화학공학부의 축구학회입니다. 2005에 설립되어 11년차를 맞이하는 학회이고 축구학회답게 매주 정기적으로 축구를 하는 모임입니다. 축구학회라고 남학생들만 있는 것이 아니라 여학우들도 가입하여 서로 어울리고 즐길수 있는 학회입니다. 예로 세레모니 체육대회를 열어 매니저들도 같이 운동에 참여할수있도록 하고 대회때는 같이 응원도 하는 남녀 상관없이 즐길수 있는 학회입니다. 세레모니는 특히 선배들간의 교류가 원할히 진행되고 있으면 실제로 00학번 선배님들까지 교류되고 있는 학회입니다."
            },
            {
              "name": "수리패",
              "description":
                  "수리패는 한국 고유의 전통문화인 사물놀이를 배우면서 전통의 멋을 만끽할 수 있는 풍물패입니다. 사물놀이의 가장 큰 특징은 관객들과의 소통을 이끌어 낸다는 것입니다. 사물놀이가 시작되는 곳이면 어느 곳이던지 꽹과리, 장구, 북, 징이 만들어 내는 소리들이 어우러져 울려 퍼질 뿐만 아니라 그 공간속에서 웃음 짓는 사람들의 모습을 찾아보실 수 있을 것입니다. 마지막으로, 한양대학교 풍물 연합이라는 단체 속에서 활동하게 되어 많은 사람들을 만나고 양질의 활동을 즐길 수 있는 학회가 될 것입니다."
            },
            {
              "name": "아우성",
              "description":
                  "아우성은 재료화학공학과에서 1988년도에 설립된 전통 있는 학회로서 처음에는 노래패로 시작했습니다. 현재는 보컬 건반 베이스 일렉기타 드럼의 악기를 만지면서 밴드의 구성을 익히며 민중가요와 자신이 좋아하는 음악을 자유롭게 할 수 있는 밴드입니다. 악기를 배운 적이 없더라도 선배들이 가르쳐주니 악기에 대한 두려움, 걱정은 하지 않으셔도 됩니다. 밴드라는 하나의 그룹을 통해서 선배와 동기간의 끈끈한 친목을 다질 수 있고 공연을 하면서 스스로 큰 성취감을 얻을 수 있다는 것에서 강한 장점이 있는 학회입니다."
            }
          ]
        },
        {
          "major": "생명나노공학과",
          "professors": [],
        },
        {
          "major": "건축학부",
          "professors": [],
        },
        {
          "major": "건설환경플랜트공학과",
          "professors": [],
        },
        {
          "major": "교통물류공학과",
          "professors": [],
        },
        {
          "major": "국방정보공학과",
          "professors": [],
        },
      ]
    },
    {
      "college": "언론정보대학",
      "alias": "college_information",
      "majors": [
        {
          "major": "정보사회미디어학과",
          "professors": [
            {
              "name": "우형진",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=20&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "김정기",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=19&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "윤영민",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=18&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "이종수",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=17&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "전범수",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=16&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "박성복",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=15&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "이창준",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=38&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
            {
              "name": "박조원",
              "subject": "",
              "site":
                  "http://mi.hanyang.ac.kr/bbs/board.php?tbl=bbs13&mode=VIEW&num=14&category=%EC%A0%84%EC%9E%84%EA%B5%90%EC%88%98&findType=&findWord=&sort1=&sort2=&it_id=&shop_flag=&mobile_flag=&page=1"
            },
          ],
          "circles": [
            {
              "name": "아이콘",
              "description":
                  "아이콘은 정보사회미디어학과의 콘텐츠학회입니다. 2013년에 시작하여 매년 선배가 후배에게 멘토링하는 방식으로 파워포인트, 포토샵,프리미어까지 대학 생활에 필요한 프로그램 활용 능력을 교육합니다. 또한 배운 내용을 바탕으로 학회 내 콘테스트를 진행하여 단순히 학습에 머무는 것이 아니라 실제 상황에서 사용할 수 있는 응용력을 기르는 것 역시 목표로 하는 학회입니다."
            },
            {
              "name": "HJBS",
              "description":
                  "HJBS는 신문방송학과 학회로 시작하여 올해부터 정보사회미디어학과 소속이 된 33년 전통영상학회 HJBS (a.k.a. 방송반) 입니다. HJBS는 Hanyang Journalism Broadcasting System 으로, 영상을 기획하고 제작하는 학회입니다."
            },
            {
              "name": "시간을 멈추는 사람들",
              "description":
                  "한양대학교 정보사회미디어학과 보도사진학회 ‘시간을멈추는사람들’은 뉴스 보도에 필요한 사진을 연구하는 학회입니다. 언론정보대학 3층에 학회실(사진실습실)이 위치하고 있으며 사진 촬영 기초 강의에서부터 정기적으로 개최하는 사진전까지 포토저널리즘을 학습합니다."
            },
            {
              "name": "Days",
              "description":
                  "정보사회미디어학과에 올해 신설된 데이터 사이언스 학회입니다. 가지고 있는 생각을 논리 있게 설명할 수 있게 데이터를 활용하여 표현합니다"
            },
          ]
        },
        {
          "major": "광고홍보학과",
          "professors": [],
        },
      ]
    },
  ];
}
