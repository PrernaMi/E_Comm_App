class ProductModel {
  dynamic? status;
  dynamic? message;
  List<PData>? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PData>[];
      json['data'].forEach((v) {
        data!.add(new PData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PData {
  dynamic? id;
  dynamic? name;
  dynamic? price;
  dynamic? image;
  dynamic? categoryId;
  dynamic? status;
  dynamic? createdAt;
  dynamic? updatedAt;

  PData(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.categoryId,
        this.status,
        this.createdAt,
        this.updatedAt});

  PData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
