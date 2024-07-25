import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_event.dart';
import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_model.dart';
import 'package:equatable/equatable.dart';

// States
abstract class ProductItemState extends Equatable {
  const ProductItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ProductItemState {}

class ItemLoading extends ProductItemState {}

class ItemLoaded extends ProductItemState {
  final ProductsItem items;

  const ItemLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class ItemError extends ProductItemState {
  final String message;

  const ItemError({required this.message});

  @override
  List<Object> get props => [message];
}