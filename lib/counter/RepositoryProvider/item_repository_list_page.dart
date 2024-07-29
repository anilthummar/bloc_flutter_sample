import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_event.dart';
import 'package:bloc_sample_flutter/counter/RepositoryProvider/product_item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_item_bloc.dart';
import 'product_item_state.dart';

class ItemRepositoryListPage extends StatelessWidget {
  final int index = 5;

  ItemRepositoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => ProductItemRepository(),
        child: BlocProvider(
          create: (context) => ProductItemBloc(
            productRepository: RepositoryProvider.of<ProductItemRepository>(context),
          )..add(FetchProductItem()),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Product Items'),
            ),
            body: BlocBuilder<ProductItemBloc, ProductItemState>(
              builder: (context, state) {
                if (state is ItemLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ItemLoaded) {
                  if (state.items.products.isEmpty) {
                    return const Center(
                      child: Text('No records found'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.items.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            state.items.products[index].thumbnail,
                            width: 50, // You can adjust the width and height as needed
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(state.items.products[index].title ?? ""),
                        );
                      },
                    );
                  }
                } else if (state is ItemError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('Press the button to fetch items'));
              },
            ),
          ),
        ),
      );

  }
}
