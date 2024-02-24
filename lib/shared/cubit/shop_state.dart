part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

final class ShopInitial extends ShopState {}
final class ShopBottomNavState extends ShopState {}

final class ShopLogingLoadingState extends ShopState {}
final class ShopLogingSuccessState extends ShopState {

  final ShopLoginModel loginModel;

  ShopLogingSuccessState(this.loginModel);

}
final class SopLogingErrorState extends ShopState {
  final String error;
  SopLogingErrorState(this.error);
}
final class ShopRegisterLoadingState extends ShopState {}
final class ShopRegisteruccessState extends ShopState {

  final ShopLoginModel registerModel;

  ShopRegisteruccessState(this.registerModel);

}
final class ShopRegisterErrorState extends ShopState {
  final String error;
  ShopRegisterErrorState(this.error);
}

final class changPasswordVisibilityState extends ShopState {}

final class ShopLoadingUpdateDataState extends ShopState {}
final class ShopSuccessUpdateDataState extends ShopState {
   final ShopLoginModel loginModel;

  ShopSuccessUpdateDataState(this.loginModel);

}
final class ShopErrorUpdateDataState extends ShopState {
  dynamic error;
  ShopErrorUpdateDataState(this.error);
}




final class ShopLoadingHomeDataState extends ShopState {}
final class ShopSuccessHomeDataState extends ShopState {

  //final DataModel dataModel;

  //SopSuccessHomeDataState(this.dataModel);

}
final class ShopErrorHomeDataState extends ShopState {
  dynamic error;
  ShopErrorHomeDataState(this.error);
}


final class ShopSuccessCatrgoryState extends ShopState {}
final class ShopErrorCategoryState extends ShopState {
   dynamic error;
  ShopErrorCategoryState(this.error);

}


final class ShopChangFavoritsState extends ShopState {}

final class ShopSuccessChangFavoritsState extends ShopState {
  ChangFavoritModel changFavoritModel;
    ShopSuccessChangFavoritsState(this.changFavoritModel);

}
final class ShopErrorChangFavoritsState extends ShopState {
  final String error;
  ShopErrorChangFavoritsState(this.error);

}

final class ShopSuccessGetFavoritsState extends ShopState {}
final class ShopErrorGetFavoritsState extends ShopState {
   dynamic error;
  ShopErrorGetFavoritsState(this.error);

}

final class ShopLoadingUserDataState extends ShopState {}
final class ShopSuccessUserDataState extends ShopState {

}
final class ShopErrorUserDataState extends ShopState {
  dynamic error;
  ShopErrorUserDataState(this.error);
}

