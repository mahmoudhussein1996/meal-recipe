import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealapp/components/meal_item.dart';
import 'package:mealapp/consts.dart';
import '../cubit/filter_cubit.dart';
import '../cubit/meal_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
            child: BlocConsumer<MealCubit, MealState>(
              listener: (context, state){},
              builder: (context, state)
              {
                if(state is Mealsucess) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: ()
                               {
                                 Navigator.pushNamed(context, '/details',arguments: state.meal.id);
                               },
                              child: MealItem(state.meal)
                            ),
                            SizedBox(height: 30,),

                           Text("Category",style: styleOftitle,),
                            SizedBox(height: 10,),
                            BlocProvider(
                              create: (context) => FilterCubit()..ListOfCategoriesOrAreas(iscategory: true),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                child: BlocBuilder<FilterCubit, FilterState>(
                                  builder: (context, state) {
                                    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 2/1,crossAxisSpacing: 5),
                                        itemCount: state is ListOfCategories? state.ListOfCategory.length : 1,
                                        itemBuilder: (context,index) => InkWell(
                                            onTap: ()
                                            {
                                              if( state is ListOfCategories)
                                                Navigator.pushNamed(context, '/mealList',arguments: {
                                                  'category' : state.ListOfCategory[index]['strCategory'].toString()
                                                });
                                            },
                                            child: state is ListOfCategories? CategoryBuild(state.ListOfCategory[index]['strCategory'].toString()) : Text("error")));
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),

                            Text("area",style: styleOftitle,),
                            SizedBox(height: 10,),
                            BlocProvider(
                             create: (context) => FilterCubit()..ListOfCategoriesOrAreas(isarea: true),
                             child: Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: BlocBuilder<FilterCubit, FilterState>(
                               builder: (context, state) {
                                  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 2/1,crossAxisSpacing: 5),
                                  itemCount: state is ListOfAreas? state.ListOfArea.length : 1,
                                  itemBuilder: (context,index) => InkWell(
                                      onTap: ()
                                      {
                                        if( state is ListOfAreas)
                                        Navigator.pushNamed(context, '/mealList',arguments: {
                                          'area' : state.ListOfArea[index]['strArea'].toString()
                                        });
                                      },
                                      child: state is ListOfAreas? CategoryBuild(state.ListOfArea[index]['strArea'].toString()) : Text("error")));
                                      },
                                       ),
                            ),
                            )
                          ],
                      ),
                    ),
                  );
                } else
                  {
                    return Text("error in loading data");
                  }
              }
          )
      )
    );
  }
}


class CategoryBuild extends StatelessWidget {
  String category;
   CategoryBuild(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(child: Text("$category",textAlign: TextAlign.center,style: styleOfresult1,)),
      ),
    );
  }
}

