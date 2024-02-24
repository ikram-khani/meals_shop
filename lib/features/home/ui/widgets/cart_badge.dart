import 'package:flutter/material.dart';
import 'package:meals_shop/data/cart_item.dart';
import 'package:meals_shop/features/home/bloc/home_bloc.dart';
import 'package:meals_shop/features/home/models/product_data_model.dart';

class CartBadge extends StatefulWidget {
  final HomeBloc homeBloc;
  final List<ProductDataModel> cartItems;
  const CartBadge({super.key, required this.homeBloc, required this.cartItems});

  @override
  State<CartBadge> createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.homeBloc.add(
        HomeCartButtonNavigateEvent(),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        height: 60,
        width: 60,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 28,
              top: 0,
              child: Container(
                width: 18,
                height: 18,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(-1, 2),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    cartItems.length.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
