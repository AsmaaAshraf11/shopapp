
// class FavoritModel {
//     bool ?status;
//     //dynamic message;
//     Data ?data;

//     FavoritModel({
//         required this.status,
//       //  required this.message,
//         required this.data,
//     });

//      FavoritModel.fromJson(Map<String, dynamic> json) {
       
//         status=json["status"] == null ? false : json['status'];
//       //  message: json["message"]== null ? null: json['status'],
//      data =new Data.fromJson(json['data']) ;
         
//      }

   
// }

// class Data {
//     int ?currentPage;
//     List<FavoratData>? data=[];
//     String ?firstPageUrl;
//     int ?from;
//     int ?lastPage;
//     String? lastPageUrl;
//     dynamic? nextPageUrl;
//     String ?path;
//     int ?perPage;
//     dynamic? prevPageUrl;
//     int ?to;
//     int ?total;

//     Data({
//         required this.currentPage,
//         required this.data,
//         required this.firstPageUrl,
//         required this.from,
//         required this.lastPage,
//         required this.lastPageUrl,
//         required this.nextPageUrl,
//         required this.path,
//         required this.perPage,
//         required this.prevPageUrl,
//         required this.to,
//         required this.total,
//     });

//      Data.fromJson(Map<String, dynamic> json) {
      
//         currentPage= json["current_page"]== null ? 0 : json['current_page'];
//     //     if (json['data'] != null) {
//     //    data = <FavoratData>[];
//     //    json['data'].forEach((v) {
//     //      data!.add(new FavoratData.fromJson(v));
//     //    });
//     //  }


//   //   json['data'].forEach((Element){
//   //    data!.add(FavoratData.fromJson(Element));
//   // });
//        data= List<FavoratData>.from(json["data"].map((x) => FavoratData.fromJson(x)));
//         firstPageUrl= json["first_page_url"]== null ? null : json['first_page_url'];
//         from= json["from"]== null ? null : json['from'];
//         lastPage= json["last_page"]== null ? null : json['last_page'];
//         lastPageUrl= json["last_page_url"]== null ? null : json['last_page_url'];
//         nextPageUrl= json["next_page_url"]== null ? null : json['next_page_url'];
//         path= json["path"]== null ? '' : json['path'];
//         perPage= json["per_page"]== null ? null : json['per_page'];
//         prevPageUrl= json["prev_page_url"]== null ? null : json['prev_page_url'];
//         to= json["to"]== null ? 0 : json['to'];
//         total= json["total"]== null ? 0 : json['total'];
    
//     }

   
// }

// class FavoratData {
//     int ?id;
//     Product? product;

//     FavoratData({
//         required this.id,
//         required this.product,
//     });

//      FavoratData.fromJson(Map<String, dynamic> json) {
//         id= json["id"];
//         product= Product.fromJson(json["product"]);
    
//      }
    
// }

// class Product {
//     int ?id;
//     dynamic? price;
//     dynamic ?oldPrice;
//     int? discount;
//     String? image;
//     String ?name;
//     String ?description;

//     Product({
//         required this.id,
//         required this.price,
//         required this.oldPrice,
//         required this.discount,
//         required this.image,
//         required this.name,
//         required this.description,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"]== null ? null : json['id'],
//         price: json["price"]== null ? null : json['price'],
//         oldPrice: json["old_price"]== null ? null : json['old_price'],
//         discount: json["discount"]== null ? null : json['discount'],
//         image: json["image"]== null ? null : json['image'],
//         name: json["name"]== null ? '' : json['name'],
//         description: json["description"]== null ? null : json['description'],
//     );

   
// }











class FavoritModel {
  bool? status;
  late Data data;

  FavoritModel({this.status,  required this.data});

  FavoritModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = new Data.fromJson(json['data']) ;
  }
}

class Data {
  int? currentPage;
  List<FavoratData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <FavoratData>[];
      json['data'].forEach((v) {
        data!.add(new FavoratData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
}

class FavoratData {
  int? id;
  Product? product;

  FavoratData({this.id, this.product});

  FavoratData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  
}