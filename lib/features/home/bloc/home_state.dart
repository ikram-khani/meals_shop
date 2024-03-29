part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigationToWishListPageActionState extends HomeActionState {}

class HomeNavigationToCartPageActionState extends HomeActionState {}

class HomeProductAddedToWishlistActionState extends HomeActionState {}

class HomeProductAddedToCartActionState extends HomeActionState {}
