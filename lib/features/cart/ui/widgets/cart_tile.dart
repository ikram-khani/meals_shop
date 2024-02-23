import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_shop/features/cart/bloc/cart_bloc.dart';
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
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productDataModel.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartBloc.add(
                        RemoveFromCartEvent(
                          productDataModel: productDataModel,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.withOpacity(1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //   cartBloc.add(
                      //     HomeProductCartButtonClickedEvent(
                      //       clickedProduct: productDataModel,
                      //     ),
                      //   );
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
