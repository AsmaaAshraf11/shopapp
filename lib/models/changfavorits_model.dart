class ChangFavoritModel{
final bool status;
  late  String message;

//final HomeDataModel data;

ChangFavoritModel({required this.status,required this.message});
   factory ChangFavoritModel.fromjson(Map<String,dynamic>json){
    return ChangFavoritModel(
     status:json['status'],
          message:json['message'],

      //data:HomeDataModel.fromjson(json['data']== null ? false : json['data'],
      );    }

}