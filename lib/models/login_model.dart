// class ShopLoginModel{
//   late  bool status;
//   late  String message;
//    late UserData data;

//     ShopLoginModel.fromjson(Map<String,dynamic>json){
//     status=json['status'];
//     message=json['message'];
//     data=(json['data']!=null? UserData.fromjson(json['data']):null)!;
//    }
// }
// class UserData{
//   late int id;
//   late String name;
//   late  String email;
//   late String phone;
//   late String image;
//   late int points;
//   late int credit;
//   late String token;
 
//   UserData.fromjson(Map<String,dynamic>json){
//     id=json['id'];
//     name=json['name'];
//     email=json['email'];
//     phone=json['phone'];
//     image=json['image']; 
//     points=json['points'];
//     credit=json['credit'];
//     token=json['koken'];

//   }
// // UserData(this.id,this.name,this.email,
//   // this.phone,this.image,this.points,this.credit,this.koken,
//   // );
// }































class ShopLoginModel {
  final bool status;
  final String message;
  final UserData data;
  ShopLoginModel(
      {required this.status, required this.message, required this.data});
  factory ShopLoginModel.fromJson(Map<String, dynamic> json) {
    return ShopLoginModel(
      status: json['status'] == null ? false : json['status'],
      message: json['message'] == null ? '' : json['message'],
      data: UserData.fromJson(
        json['data'] == null ? {} : json['data'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data.toMap(),
    };
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] == null ? 0 : json['id'],
      name: json['name'] == null ? '' : json['name'],
      email: json['email'] == null ? '' : json['email'],
      phone: json['phone'] == null ? '' : json['phone'],
      image: json['image'] == null ? '' : json['image'],
      points: json['points'] == null ? 0 : json['points'],
      credit: json['credit'] == null ? 0 : json['credit'],
      token: json['token'] == null ? '' : json['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }
}











