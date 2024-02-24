import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/network/remote/dio_helper.dart';

import '../../models/category_model.dart';
import '../../models/changfavorits_model.dart';
import '../../models/favorit_model.dart';
import '../../models/hom_model.dart';
import '../../models/login_model.dart';
import '../../modules/category_screen.dart';
import '../../modules/favorites_screen.dart';
import '../../modules/home_screen.dart';
import '../../modules/settings.dart';
import '../../network/remote/End_point.dart';
import '../component/Constants.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
   static ShopCubit  get(context)=>BlocProvider.of(context);
        ChangFavoritModel? changFavoritModel;
             Map<int,bool> favorite={};
             FavoritModel ?favoritModel;
           CategoryModel ? categorymodel;
                ShopLoginModel ?userModel;
                ShopLoginModel ?userUpdateModel;


      void getCategoryData(){
            DioHelper.getData(
              url: Category,
              token:token,
              ).then((value) {
               categorymodel=CategoryModel.fromJson(value.data);
              //print(categorymodel!.data.data[1].name);
             // print(dataModel!.data.banners[1].id);

            emit(ShopSuccessCatrgoryState());

            },
            ).catchError((onError){
              print(onError.toString());
           emit(ShopErrorCategoryState(onError));
            });
          }
      // void getFavoritData(){
      //       DioHelper.getData(
      //         url: 'favorites',
      //         token:'aXXCy0PnAEWNh5jzdPupX5chkbUEOOi613r07Bj1JJ7PsPSuO0GpHaFu7HwdIefpp2v765',
      //         ).then((value) {
      //          favoritModel=FavoritModel.fromJson(value.data);
      //         print(favoritModel!.data!.from);

      //       emit(ShopSuccessGetFavoritsState());


      //       },
      //       ).catchError((onError){
      //         print(onError.toString());
      //      emit(ShopErrorGetFavoritsState(onError));
      //       });
      //     }
      
       int currentIndex=0;
           HomeModel? dataModel;
       List<BottomNavigationBarItem> BottomItem=[
        const BottomNavigationBarItem(icon: Icon(Icons.home),
                label: 'Home'),
                  const BottomNavigationBarItem(icon: Icon(Icons.apps),
                label: 'Categories'),
                  const BottomNavigationBarItem(icon: Icon(Icons.favorite),
                label: 'Favorites'),
                  const BottomNavigationBarItem(icon: Icon(Icons.settings),
                label: 'settings')
          ];
     List<Widget>bottomScreen=[
      ProductsScreen(),
      CategoryScreen(),
      FavoritsScreen(),
      SettingScreen(),
     ];
      void changBottomNavBar(index){
            currentIndex=index;
           
            emit(ShopBottomNavState());
          }
          void getHomeData ()async{
            emit(ShopLoadingHomeDataState());
            DioHelper.getData(
              url: Home,
              token:token,
              ).then((value) {
               dataModel=HomeModel.fromjson(value.data);
             // print(dataModel!.data.products[1].name);
              dataModel!.data.products.forEach((Element){
               favorite.addAll({
                Element.id : Element.in_favorites
               });
              });
            //  print(favorite.toString());

            emit(ShopSuccessHomeDataState());


            },
            ).catchError((onError){
              print(onError.toString());
           emit(ShopErrorHomeDataState(onError));
            });
          }
    void ChangFavorits(int productId)
    {
              favorite[productId]=!favorite[productId]!;

                       emit(ShopChangFavoritsState());


          DioHelper.PostData(url: Favorits,
             Data: {
              'product_id':productId
             },
             token: token
             ).then((value) {
               changFavoritModel=ChangFavoritModel.fromjson(value.data);
                     // print(value.data.toString());

               if(!changFavoritModel!.status){

              favorite[productId]=!favorite[productId]!;

               }
             emit(ShopSuccessChangFavoritsState(changFavoritModel!));
             } 
                
             ).catchError((onError){
              favorite[productId]=!favorite[productId]!;

             emit(ShopErrorChangFavoritsState(onError));


             });

    }
             void getUserData(){
             emit(ShopLoadingUserDataState());
             
            DioHelper.getData(
              url: Profile,
              token:token,
              ).then((value) {
               userModel=ShopLoginModel.fromJson(value.data);
             // print(userModel!.message);

            emit(ShopSuccessUserDataState());


            },
            ).catchError((onError){
              print(onError.toString());
           emit(ShopErrorUserDataState(onError));
            });
          }









    late ShopLoginModel loginModel;
     void UserLogin({
      required String email,required String password,
     }){
       emit(ShopLogingLoadingState());
      DioHelper.PostData(url: LOGIN, 
      Data:{
        'email':email,
        'password':password

      },
      
      ).then((value) {
        loginModel= ShopLoginModel.fromJson(value.data);
        //print(loginModel.data.name);
        //print(loginModel.message);

       //  print(value.data['message']);
        emit(ShopLogingSuccessState(loginModel!));
      },).catchError((onError){
        print(onError.toString());
      emit(SopLogingErrorState(onError.toString()));
      });
     } 
     IconData suffix= Icons.visibility;
       bool hidePasswor = true;
   void changPasswordVisibility(){
    hidePasswor=!hidePasswor;
     suffix=hidePasswor? Icons.visibility_off:Icons.visibility;
     emit(changPasswordVisibilityState());
   }


 //late
     ShopLoginModel ?registerModel;
     void UserRegister({ required String name,
      required String email,required String password,required String phone,
     }){
       emit(ShopRegisterLoadingState());
      DioHelper.PostData(url: Register, 
      Data:{
         'name':name,
        'email':email,
        'password':password,
        'phone':phone,


      },
      
      ).then((value) {
        registerModel= ShopLoginModel.fromJson(value.data);
        //print(loginModel.data.name);
        //print(loginModel.message);

       //  print(value.data['message']);
        emit(ShopRegisteruccessState(registerModel!));
      },).catchError((onError){
        print(onError.toString());
      emit(ShopRegisterErrorState(onError.toString()));
      });
     } 


      void UpdateUserData({ required String name,
      required String email,required String phone, String ?password, }){
            emit(ShopLoadingUpdateDataState());
            DioHelper.PutData(
              url: Update,
              token:token, 
              Data:{
        'name':name,
       'email':email,
        'phone':phone,
       // 'password':password,

        

      },
              ).then((value) {
        userModel= ShopLoginModel.fromJson(value.data);
              print(userModel!.status);

            emit(ShopSuccessUpdateDataState(userModel!));


            },
            ).catchError((onError){
              print(onError.toString());
           emit(ShopErrorUpdateDataState(onError));
            });
          }
    

} 
             