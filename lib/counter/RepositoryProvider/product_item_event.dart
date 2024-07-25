import 'package:equatable/equatable.dart';

// Events
abstract class ProductItemEvent extends Equatable {
  const ProductItemEvent();

  @override
  List<Object> get props => [];
}

class FetchProductItem extends ProductItemEvent {}