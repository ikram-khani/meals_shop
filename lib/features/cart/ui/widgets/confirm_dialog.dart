import 'package:flutter/material.dart';
import 'package:meals_shop/features/cart/bloc/cart_bloc.dart';
import 'package:meals_shop/features/home/models/product_data_model.dart';

class ShowConfirmDialog {
  static void show(BuildContext context, ProductDataModel productDataModel,
      CartBloc cartBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text(
              "Are you sure you want to remove this item from the cart?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                cartBloc.add(
                  RemoveFromCartEvent(
                    productDataModel: productDataModel,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
