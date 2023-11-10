class Product {
  String? iD;
  String? name;
  String? price;
  String? image;
  String? image3d;
  String? description;
  String? subDescription;
  String? type;

  Product(
      {this.iD,
      this.name,
      this.price,
      this.description,
      this.image,
      this.type,
      this.subDescription,
      this.image3d});

  Product.fromJson(Map<String, dynamic> json) {
    iD = json["product_id"];
    name = json["name"];
    price = json["price"];
    description = json["description"];
    image = json["image_url"];
    type = json["badge"];
    image3d = json["image_url_3d"];
    subDescription = json["sub_description"];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["product_id"] = iD;
    data["name"] = name;
    data["price"] = price;
    data["description"] = description;
    data["image_url"] = image;
    data["sub_description"] = subDescription;
    data["badge"] = type;
    return data;
  }
}

List productModels = [
  "assets/models3d/Man.glb",
  'assets/models3d/Bench.glb',
  "assets/models3d/Snake.glb",
  "assets/models3d/ZAHA_LIGHT.glb",
  "assets/models3d/tora_bag/glb",
  "assets/models3d/thor.glb",
  "assets/models3d/Rixa.glb",
  "assets/models3d/lamp.glb",
  "assets/models3d/haging_chair.glb",
];
