class Club{
  String name;

  Club(this.name);

  Club.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}