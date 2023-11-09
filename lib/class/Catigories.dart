

class Catigories{
  String? title;
  String? type;
  String? suptype;
  String? image;
  double? content;

  Catigories({required this.title, required this.type, required this.suptype, required this.image,required this.content});

  Catigories.fromJson(Map<String,dynamic> json){
    title = json["title"];
    type = json["type"];
    suptype = json["sup_type"];
    image = json["image"];
    content = json["content"];
  }
}