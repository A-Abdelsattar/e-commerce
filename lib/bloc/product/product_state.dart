part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class GetProductsSuccess extends ProductState {}
class GetProductsLoading extends ProductState {}
class GetProductsError extends ProductState {}

class GetProductsAccordingSuccess extends ProductState {}
class GetProductsAccordingLoading extends ProductState {}
class GetProductsAccordingError extends ProductState {}
