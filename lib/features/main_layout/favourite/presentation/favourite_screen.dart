import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/favourite/presentation/cubit/favourite_screen_view_model.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/favourite/presentation/cubit/favourite_screen_states.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../di/di.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavouriteScreenViewModel>()..getWishlist(),
      child: BlocBuilder<FavouriteScreenViewModel, FavouriteStates>(
          builder: (BuildContext context, state) {
            if (state is GetFavouriteLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetFavouriteErrorState) {
              return Center(
                child: Text('Error Loading Your Favourites', style: TextStyle(
                    color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
                ),
              );
            }
            else if (state is GetFavouriteSuccessState) {
              final wishlist = state.responseEntity.data ?? [];
      
              if (wishlist.isEmpty) {
                return const Center(child: Text('No favourites yet'));
              }
              return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                  child: ListView.builder(
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                        child:
                        FavoriteItem(product:wishlist[index]),
                      );
                    },
                  )
              );
            }
            return const SizedBox();
          }
      ),
    );
  }
}
