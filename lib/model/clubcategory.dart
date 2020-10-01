class ClubCategory{
  String category;
  List<dynamic> clubs;

  ClubCategory(this.category);

  ClubCategory.fromJson(Map<String, dynamic> json){
    category = json['category'];
    clubs = json['clubs'];
  }
}