import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/network/remote/diohelper.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  void ListOfCategoriesOrAreas({bool iscategory = false, bool isarea = false})
  {

    if(iscategory)
      {
        DioHelper.getData(url:'list.php', query: {
          'c':'list'
        }).then((value)
        {
          emit(ListOfCategories(value.data['meals']));
        }).catchError((onerror){
          emit(filtererrorState());
        });
      }
    else if(isarea)
    {
      DioHelper.getData(url:'list.php', query: {
        'a':'list'
      }).then((value)
      {
        emit(ListOfAreas(value.data['meals']));
      }).catchError((error){
        emit(filtererrorState());
      });
    }

    else
      {
        emit(filtererrorState());
      }
  }
}
