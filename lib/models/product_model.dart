class ProductModel {
  int? status;
  String? message;
  List<Product>? poroducts;

  ProductModel({this.status, this.message, this.poroducts});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      poroducts = <Product>[];
      json['data'].forEach((v) {
        poroducts!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.poroducts != null) {
      data['data'] = this.poroducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? categoryName;
  String? name;
  bool? isFavorite=false;

  var price;
  int? qty;
  String? image;
  int? offer;

  Product(
      {this.id,
        this.categoryName,
        this.name,
        this.price,
        this.qty,
        this.image,
        this.offer,this.isFavorite});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category name'];
    name = json['name'];
    price = json['price'];
    qty = json['qty'];
    image = json['image'];
    offer = json['offer'];
     isFavorite=false;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category name'] = categoryName;
    data['name'] = name;
    data['price'] = price;
    data['qty'] = qty;
    data['image'] = image;
    data['offer'] = offer;
    return data;
  }
}