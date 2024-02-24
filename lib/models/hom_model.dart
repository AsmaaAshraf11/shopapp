
import 'package:flutter/material.dart';

class HomeModel{
final bool status;
final HomeDataModel data;

HomeModel({required this.status,required this.data});
   factory HomeModel.fromjson(Map<String,dynamic>json){
    return HomeModel(
     status:json['status']== null ? false : json['status'],
      data:HomeDataModel.fromjson(json['data']== null ? false : json['data'],
      ));    }
}
class HomeDataModel{
   List<bannersModel>banners=[];
   List<productsModel>products=[];
    HomeDataModel.fromjson(Map<String,dynamic>json){
  json['banners'].forEach((Element){
     banners.add(bannersModel.fromjson(Element));
  });
  json['products'].forEach((Element){
     products.add(productsModel.fromjson(Element));
  });  
   }
}
class bannersModel {
  int id;
  String image;
  bannersModel({required this.id,required this.image});
   factory  bannersModel.fromjson(Map<String,dynamic>json){
    return bannersModel(
      id:json['id'],
      image:json['image'],
    );

     }
}
 class productsModel{
  int id;
  String image;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String name;
  bool in_favorites;
  bool in_cart;
  productsModel({required this.id,required this.image,required this.price,required this.old_price,
  required this.discount,required this.name,required this.in_favorites,required this.in_cart});
    factory   productsModel.fromjson(Map<String,dynamic>json){
     return productsModel(
      id:json['id'],
      image:json['image'],
      price:json['price'],
      old_price:json['old_price'],
      discount:json['discount'],
      name:json['name'],
      in_favorites:json['in_favorites']==null?false:json['in_favorites'],
      in_cart:json['in_cart'],

     );
       }


 }











// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);
// import 'dart:convert';

// DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

// String dataModelToJson(DataModel data) => json.encode(data.toJson());

// class DataModel {
//     bool status;
//     Data data;

//     DataModel({
//         required this.status,
//         required this.data,
//     });

//     factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//         status: json["status"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     List<Banner> banners;
//     List<Product> products;
    

//     Data({
//         required this.banners,
//         required this.products,
    
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
//         products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//     };
// }

// class Banner {
//     int id;
//     String image;

//     Banner({
//         required this.id,
//         required this.image,
//     });

//     factory Banner.fromJson(Map<String, dynamic> json) => Banner(
//         id: json["id"],
//         image: json["image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//     };
// }

// class Product {
//     int id;
//     double price;
//     double oldPrice;
//     int discount;
//     String image;
//     String name;
//     String description;
//     List<String> images;
//     bool inFavorites;
//     bool inCart;

//     Product({
//         required this.id,
//         required this.price,
//         required this.oldPrice,
//         required this.discount,
//         required this.image,
//         required this.name,
//         required this.description,
//         required this.images,
//         required this.inFavorites,
//         required this.inCart,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         price: json["price"]?.toDouble(),
//         oldPrice: json["old_price"]?.toDouble(),
//         discount: json["discount"],
//         image: json["image"],
//         name: json["name"],
//         description: json["description"],
//         images: List<String>.from(json["images"].map((x) => x)),
//         inFavorites: json["in_favorites"],
//         inCart: json["in_cart"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "price": price,
//         "old_price": oldPrice,
//         "discount": discount,
//         "image": image,
//         "name": name,
//         "description": description,
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "in_favorites": inFavorites,
//         "in_cart": inCart,
//     };
// }
