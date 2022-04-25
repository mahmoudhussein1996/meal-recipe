part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class ListOfCategories extends FilterState
{
  List<dynamic> ListOfCategory;

  ListOfCategories(this.ListOfCategory);
}

class ListOfAreas extends FilterState
{
  List<dynamic>ListOfArea;

  ListOfAreas(this.ListOfArea);
}

class filtererrorState extends FilterState
{
}
