import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../categories/presentation/categories_tab.dart';
import '../../favourite/presentation/favourite_screen.dart';
import '../../home/presentation/home_tab.dart';
import '../../profile_tab/presentation/profile_tab.dart';

import 'home_states.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeInitialState());

  //todo : Handle logic && Hold data


  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];


 void changeSelectedIndex(int selectedIndex) {
   emit(HomeInitialState());
      currentIndex = selectedIndex;
    emit(ChangeHomeState());
  }
}
