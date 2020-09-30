class Major{
  String name;


  Major({this.name});

  Major.fromJson(Map<String, dynamic> json){
    name = json['major'];
  }
}