class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String location;
  String image;
  List<String> episode;
  String url;
  String created;

 Character.fromMap(Map<String, dynamic> map) 
   : id = map['id'] ?? "",
    name = map['name']?? "",
    status = map['status'] ?? "",
    species = map['species'] ?? "",
    type = map['type']?? "",
    gender = map['gender'] ?? "",
    location = map["location"]?["name"]?? "",
    image = map['image']?? "",
    episode = map['episode'].cast<String>() ?? "",
    url = map['url'] ?? "",
    created = map['created']?? "";
  
}