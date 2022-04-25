import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealapp/cubit/meal_cubit.dart';
import 'package:mealapp/models/mealCategoryModel.dart';

import '../components/meal_list_item.dart';

class MealList extends StatelessWidget {
  const MealList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String  searchType = "";
    final routes = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    String arae = routes['area']!= null? routes['area'] as String : "";
    String category = routes['category']!= null? routes['category'] as String : "";

    return Scaffold(
      appBar: AppBar(title: Text(!arae.isEmpty? arae: !category.isEmpty? category : "")),
      body: BlocProvider(
        create: (context) => MealCubit()..ListMealsByAreaOrCategory(category: category,area: arae),
        child: BlocBuilder<MealCubit, MealState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (value){
                      MealCubit.get(context).searchMeal(value);
                    },
                    decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: BlocBuilder<MealCubit, MealState>(
                    builder: (context, state) {
                      return Container(
                        child: ListView.builder(itemBuilder: (context, index) {
                          if(state is listMealsByCategory)
                          {

                            return MealListItem(MealCategoryModel.fromJson(state.mealsCategoryList[index]));
                          }
                          else if(state is listMealsByArea)
                          {
                            return MealListItem(MealCategoryModel.fromJson(state.mealsArealist[index]));
                          }
                          else if(state is searchSuccess)
                          {

                           return MealListItem(MealCategoryModel.fromJson(state.mealSearchlist[index]));

                          }
                          else return Text("wait untill loading data");
                        }, itemCount: state is listMealsByCategory? state.mealsCategoryList.length : state is listMealsByArea? state.mealsArealist.length : 1,),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}




