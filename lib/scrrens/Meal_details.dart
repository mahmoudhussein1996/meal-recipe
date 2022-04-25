import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealapp/components/meal_item.dart';
import 'package:mealapp/cubit/meal_cubit.dart';

import '../consts.dart';
import '../models/mealmodel.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  String mealid = ModalRoute.of(context)!.settings.arguments as String;
  
    return BlocProvider(
     create: (context) => MealCubit()..getmeal(id: mealid),
     child: Scaffold(
       backgroundColor: Color.fromRGBO(255, 250, 250, 0.8),
      appBar: AppBar(
        title: Text("details"),
      ),

      body: BlocConsumer<MealCubit, MealState>(

                  listener: (context, state){},
                  builder: (context, state)
                  {
                    if(state is MealDetailsucess) {
                     return  SingleChildScrollView(
                       child: Column(
                         children: [
                           Container(

                             width: MediaQuery.of(context).size.width,
                             height: MediaQuery.of(context).size.height * 0.5,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               shape: BoxShape.rectangle,
                               image: DecorationImage(
                                   image: NetworkImage('${state.mealDetail.image.toString()}'),
                                   fit: BoxFit.fill
                               ),
                             ),
                           ),
                           SizedBox(height: 10,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                             ),
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Name",style: styleOftitle,),
                                       SizedBox(width:100),
                                       Container(
                                           width:MediaQuery.of(context).size.width * 0.3,
                                           height: 70
                                           ,child: Text(state.mealDetail.name.toString(),style: styleOfresult,))
                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("Area",style: styleOftitle,),
                                       Text(state.mealDetail.area.toString(),style: styleOfresult,)
                                     ],
                                   ),
                                   SizedBox(height: 20,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("Category",style: styleOftitle,),
                                       Text(state.mealDetail.category.toString(),style: styleOfresult,)
                                     ],
                                   ),
                                   SizedBox(height: 20,),
                                   Text("instructions",style: styleOftitle),
                                   SizedBox(height: 20,),
                                   Container(
                                     width: MediaQuery.of(context).size.width,
                                     height: MediaQuery.of(context).size.height * 0.4,
                                     child: Text("${state.mealDetail.instruction}",style: styleOfresult1,),
                                   ),

                                   SizedBox(height: 20,),
                                   IngredientItem(state.mealDetail),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                    );

                    }
                    else
                    {
                      return Text("error in loading meal data ");
                    }
                  }
              )


      )
    );
  }
}

class IngredientItem extends StatelessWidget {

  Meals mealdetail;
   IngredientItem(this.mealdetail);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ingredient",style: styleOftitle,),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient1}",style: styleOftitle,),Text("${mealdetail.strMeasure1}",style: styleOfresult1,)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient2}",style: styleOftitle),Text("${mealdetail.strMeasure2}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient3}",style: styleOftitle),Text("${mealdetail.strMeasure3}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient4}",style: styleOftitle),Text("${mealdetail.strMeasure4}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient5}",style: styleOftitle),Text("${mealdetail.strMeasure5}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient6}",style: styleOftitle),Text("${mealdetail.strMeasure6}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient7}",style: styleOftitle),Text("${mealdetail.strMeasure7}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient8}",style: styleOftitle),Text("${mealdetail.strMeasure8}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient9}",style: styleOftitle),Text("${mealdetail.strMeasure9}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient10}",style: styleOftitle),Text("${mealdetail.strMeasure10}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient11}",style: styleOftitle),Text("${mealdetail.strMeasure11}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient12}",style: styleOftitle),Text("${mealdetail.strMeasure12}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient13}",style: styleOftitle),Text("${mealdetail.strMeasure13}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient14}",style: styleOftitle),Text("${mealdetail.strMeasure14}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient15}",style: styleOftitle),Text("${mealdetail.strMeasure15}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient16}",style: styleOftitle),Text("${mealdetail.strMeasure16}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient17}",style: styleOftitle),Text("${mealdetail.strMeasure17}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient18}",style: styleOftitle),Text("${mealdetail.strMeasure18}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient19}",style: styleOftitle),Text("${mealdetail.strMeasure19}",style: styleOfresult1)],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("${mealdetail.strIngredient20}",style: styleOftitle),Text("${mealdetail.strMeasure20}",style: styleOfresult1)],
              ),
            ],
          ),
        )
      ],
    );
  }
}
