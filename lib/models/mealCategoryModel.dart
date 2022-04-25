class MealCategoryModel {
  String? id, name, image;

  MealCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['idMeal'];
    name = json['strMeal'];
    image = json['strMealThumb'];
  }
}