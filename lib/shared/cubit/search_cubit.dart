import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/network/remote/dio_helper.dart';
import 'package:shopapp/shared/component/Constants.dart';

import '../../models/search_model.dart';
import '../../network/remote/End_point.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit  get(context)=>BlocProvider.of(context);
  SearchModel ?searchModel;
  void search(String text){
    DioHelper.PostData(
      url: Search,
      token: token,
       Data: {
        'text':text,
        
       }
       ).then((value) {

               searchModel=SearchModel.fromJson(value.data);
               print(searchModel!.data!.firstPageUrl);

        emit(SearchSuccessState(searchModel!));
       }).catchError((onError){
       print(onError.toString());
        emit(SearchErrorState(onError));


       });


  }
}
