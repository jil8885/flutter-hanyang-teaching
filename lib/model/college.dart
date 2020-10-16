class College {
  String college;
  String alias;
  List<Map<String, dynamic>> majors;

  College({this.college, this.alias, this.majors});

  College.fromJson(Map<String, dynamic> json) {
    college = json['college'];
    alias = json['alias'];
    majors = json['majors'];
  }
}
