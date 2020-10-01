class Major{
  String name;
  List<dynamic> professors;

  Major({this.name, this.professors});

  Major.fromJson(Map<String, dynamic> json){
    name = json['major'];
    professors = json['professors'];
  }
}