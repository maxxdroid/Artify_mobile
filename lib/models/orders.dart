class Orders {
  String? iD;
  String? userId;
  String? productId;

  Orders({
    this.iD,
    this.userId,
    this.productId,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    iD = json["Orders Id"];
    userId = json["Name"];
    productId = json["productId"];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Orders Id"] = iD;
    data["Name"] = userId;
    data["productId"] = productId;
    return data;
  }
}
