part of 'meal_cubit.dart';

@immutable
abstract class MealState {}

class MealInitial extends MealState {}

class Mealsucess extends MealState {

  Meals meal;
  Mealsucess(this.meal);
}

class MealDetailsucess extends MealState {

  Meals mealDetail;
  MealDetailsucess(this.mealDetail);
}

class listMealsByCategory extends MealState {

  List<dynamic> mealsCategoryList;
  //int count;
  listMealsByCategory(this.mealsCategoryList);
}

class listMealsByArea extends MealState {

  List<dynamic> mealsArealist;
  listMealsByArea(this.mealsArealist);

}


class searchSuccess extends MealState {

  List<dynamic> mealSearchlist;
  searchSuccess(this.mealSearchlist);

}

class searcherror extends MealState {

  searcherror();

}
class Mealerror extends MealState {}




