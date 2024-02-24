part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoadingState extends SearchState {}
final class SearchSuccessState extends SearchState {

  final SearchModel searchModel;

  SearchSuccessState(this.searchModel);

}
final class SearchErrorState extends SearchState {
var error;
  SearchErrorState(this.error);
}
