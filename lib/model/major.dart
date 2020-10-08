class Major {
  String name;
  List<dynamic> professors;
  List<dynamic> circles;

  Major({this.name, this.professors, this.circles});

  Major.fromJson(Map<String, dynamic> json) {
    name = json['major'];
    professors = json['professors'];
    circles = json['circles'];
  }
}
