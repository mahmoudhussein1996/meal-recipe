import 'package:flutter/material.dart';
import 'package:mealapp/consts.dart';
import 'package:mealapp/models/mealCategoryModel.dart';


class MealListItem extends StatelessWidget {
  MealCategoryModel meal;
   MealListItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.pushNamed(context, '/details',arguments: meal.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              children: [
                Container(

                  width: MediaQuery.of(context).size.width * 0.5,
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
                SizedBox(width:  25,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Text(meal.name.toString(),style: styleOftitle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}