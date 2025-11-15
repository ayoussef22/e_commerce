import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/core/routes_manager/routes.dart';
import 'package:flutter_e_commerce_c11_online/features/cart/screens/cart_screen.dart';
import 'package:flutter_e_commerce_c11_online/features/splash/splash_screen.dart';

import '../../domain/entities/ProductResponseEntity.dart';
import '../../features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import '../../features/auth/presentation/screens/sign_up/sign_up_screen.dart';
import '../../features/main_layout/main_screen/home_screen.dart';
import '../../features/product_details/presentation/screen/product_details.dart';
import '../../features/products_screen/presentation/screens/products_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) =>  ProductsScreen());

      case Routes.productDetails:
        final product = settings.arguments as ProductEntity;
        return MaterialPageRoute(builder: (_) => ProductDetails(product: product));

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  SignInScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
