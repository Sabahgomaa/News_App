import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/DioHelper/dio_helper.dart';
import 'package:news/views/Search/cubit/states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<dynamic> search = [];
  void getSearch(dynamic value) {
    emit(SearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }
}
