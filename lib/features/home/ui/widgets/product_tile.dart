import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_shop/features/home/models/product_data_model.dart';

import '../../bloc/home_bloc.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

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
              placeholder: (context, url) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: Colors.grey[300],
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]!),
                ),
              ),
              errorWidget: (context, url, error) {
                return Column(
                  children: [
                    const Icon(Icons.error),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Oops! Something went wrong while loading data.',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: const Text(
                        'Try again',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => homeBloc.add(HomeInitialEvent()),
                    )
                  ],
                );
              },
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
                      homeBloc.add(
                        HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
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
