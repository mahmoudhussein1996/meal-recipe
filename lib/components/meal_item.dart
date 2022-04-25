import 'package:flutter/material.dart';
import 'package:mealapp/consts.dart';
import 'package:mealapp/models/mealmodel.dart';

class MealItem extends StatelessWidget {
  Meals meal;

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                  image: DecorationImage(
                 image: NetworkImage('${meal.image.toString()}'),
                  fit: BoxFit.fill
             ),
            ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 10,
              right: 10,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          width:MediaQuery.of(context).size.width * 0.4,
                          height:MediaQuery.of(context).size.height * 0.14,child: Text(meal.name.toString(),style: styleOftitle1,maxLines: 2,)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(meal.category.toString(),style: styleOfresult1,),
                        Text(meal.area.toString(),style: styleOfresult1)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
    );
  }
}
