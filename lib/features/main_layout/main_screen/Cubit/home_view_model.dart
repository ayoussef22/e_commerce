import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/screens/products_screen.dart';
import '../../favourite/presentation/favourite_screen.dart';
import '../../home/presentation/home_tab.dart';
import '../../profile_tab/presentation/profile_tab.dart';

import 'home_states.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  //todo : Handle logic && Hold data

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    ProductsScreen(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialState());
    currentIndex = selectedIndex;
    emit(ChangeHomeState());
  }
}
