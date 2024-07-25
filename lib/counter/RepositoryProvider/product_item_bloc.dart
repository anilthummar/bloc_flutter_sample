

import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_event.dart';
import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_model.dart';
import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_repository.dart';
import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {

  var  productRepository = ProductItemRepository();

  ProductItemBloc({required this.productRepository}) : super(ItemInitial()) {
    on<FetchProductItem>((event, emit) async {
      emit(ItemLoading());

      try {
        final productsItem = await productRepository.fetchProductItems();
        print('Total Products: ${productsItem.total}');
        for (var product in productsItem.products) {
          print('Product: ${product.title}');
        }
        emit(ItemLoaded(items: productsItem));
      } catch (e) {
        print('Error: $e');
        emit(ItemError(message: e.toString()));
      }
    });
  }
}