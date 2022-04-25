import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealapp/models/mealCategoryModel.dart';
import 'package:mealapp/network/remote/diohelper.dart';
import 'package:meta/meta.dart';

import '../models/mealmodel.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());

  static MealCubit get(context) => BlocProvider.of(context);

  void getmeal({String id = ""})
  {
    if(id.isEmpty)
      {
        DioHelper.getData(url:'random.php', query: {}).then((value)
        {
          Meals meal = Meals.fromJson(value.data['meals'][0]);
          emit(Mealsucess(meal));
        }).catchError((error){
          print(error);
          emit(Mealerror());
        });
      }
    else
      {
        DioHelper.getData(url: 'lookup.php', query: {
          'i': id
        }).then((value)
        {
          Meals mealdetail = Meals.fromJson(value.data['meals'][0]);
          emit(MealDetailsucess(mealdetail));
        }).catchError((error){
          print(error);
          emit(Mealerror());
        });
      }

  }

  void ListMealsByAreaOrCategory({String category  = "", String area  = ""})
  {

    if(!category.isEmpty)
      {
        DioHelper.getData(url:'filter.php', query: {
          'c': category
        }).then((value)
        {
         // List<MealCategoryModel> ListOfMealsByCategory = [];
          emit(listMealsByCategory(value.data['meals']));
        }).catchError((error)
        {
          emit(Mealerror());
        });
      }

    else if (!area.isEmpty)
      {
        DioHelper.getData(url: 'filter.php', query: {
          'a': area
        }).then((value)
        {
          emit(listMealsByArea(value.data['meals']));
        }).catchError((error)
        {
          emit(Mealerror());
        });
      }
    else{
      emit(Mealerror());
    }
  }

  void searchMeal(String meal)
  {

    if(meal.length == 1)
      {
        DioHelper.getData(url:'search.php', query: {
          'f' : meal
        }).then((value)
        {
           emit(searchSuccess(value.data['meals']));
        }).catchError((error){
            emit(searcherror());
        });
      }
    else if(meal.length > 1)
      {
        DioHelper.getData(url:'search.php', query: {
          's' : meal
        }).then((value)
        {

          emit(searchSuccess(value.data['meals']));

        }).catchError((error){
          emit(searcherror());
        });
      }
  }
}
