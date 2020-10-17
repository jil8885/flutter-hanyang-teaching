class Circle {
  String name;
  String description;

  Circle(this.name, this.description);

  Circle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }
}
