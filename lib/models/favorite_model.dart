class FavoriteModel {
  int? status;
  String? message;
  FavoriteItems? data;

  FavoriteModel({this.status, this.message, this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? FavoriteItems.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FavoriteItems {
  List<WishList>? wishList;

  FavoriteItems({this.wishList});

  FavoriteItems.fromJson(Map<String, dynamic> json) {
    if (json['wish_list'] != null) {
      wishList = <WishList>[];
      json['wish_list'].forEach((v) {
        wishList!.add(WishList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wishList != null) {
      data['wish_list'] = wishList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishList {
  bool? favorite=false;
  int? id;
  int? userId;
  int? productId;
  String? createdAt;
  String? updatedAt;

  WishList(
      {this.id, this.userId, this.productId, this.createdAt, this.updatedAt,this.favorite=false});

  WishList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favorite=false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}