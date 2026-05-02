class ModelsDrinks {
final String title;
final String description;
final String image;
final int id;

  ModelsDrinks({required this.title, required this.description, required this.image, required this.id});



  factory ModelsDrinks.fromjson(Map<String,dynamic>json){
    return ModelsDrinks(
      title:json["title"]  ?? "",
       description:json["description"] ?? "" ,
        image:json["image"] ?? "" ,
         id:json ["id"] ?? "", 
         );
  }


}