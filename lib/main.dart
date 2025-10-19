import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/core/widget/shared_preference_utils.dart';
import 'package:flutter_e_commerce_c11_online/features/cart/cubit/get_cart_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'di/di.dart';
import 'features/products_screen/presentation/cubit/product_screen_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferenceUtils.init();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>getIt<ProductScreenViewModel>() ),
      BlocProvider(create: (_)=>getIt<GetCartViewModel>() )
    ],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {

   const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      ),
    );
  }
}
