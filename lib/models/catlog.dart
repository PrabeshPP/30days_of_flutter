class CatlogModel {
  static final items = [
    Items(id: 1,
     name:"one plus 7", 
     description:"One plus 7 with --8 GB of Ram and 256 GB of storage",
      price: 70000, 
      color: "red", 
      image: "https://cdn.opstatics.com/store/20170907/assets/images/events/instant-noodle/19821/pics/full/3.webp"),
  ];
}

class Items {
  final num id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Items(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
