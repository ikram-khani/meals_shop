import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_shop/features/cart/bloc/cart_bloc.dart';
import 'package:meals_shop/features/cart/ui/widgets/confirm_dialog.dart';
import 'package:meals_shop/features/home/models/product_data_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: deviceWidth / 3.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 500),
                placeholderFadeInDuration: const Duration(milliseconds: 300),
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: productDataModel.imageUrl,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  productDataModel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productDataModel.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () => ShowConfirmDialog.show(
                          context, productDataModel, cartBloc),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.withOpacity(1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
