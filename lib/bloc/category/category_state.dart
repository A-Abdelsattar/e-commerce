part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetCategoriesSuccess extends CategoryState {}
class GetCategoriesLoading extends CategoryState {}
class GetCategoriesError extends CategoryState {}

