import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealapp/cubit/meal_cubit.dart';
import 'package:mealapp/network/remote/diohelper.dart';
import 'package:mealapp/scrrens/Home.dart';
import 'package:mealapp/scrrens/Meal_details.dart';
import 'package:mealapp/scrrens/meal_list.dart';

void main() {

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       initialRoute: '/',
       routes: {
         '/details' : (context) => MealDetails(),
         '/mealList' : (context) => MealList()
       },
        title: 'meals',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home:  MultiBlocProvider(
        providers: [
        BlocProvider(create: (_) => MealCubit()..getmeal()),
     ], child:  Home(),
        )
     );
  }
}

