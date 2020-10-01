class Professor{
  String name;
  String subject;
  String site;

  Professor({this.name, this.subject, this.site});

  Professor.fromJson(Map<String, dynamic> json){
    name = json['name'];
    subject = json['subject'];
    site = json['site'];
  }
}