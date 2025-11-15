import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/login_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/register_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/auth/presentation/screens/sign_in/cubit/sign_in_states.dart';
import 'package:flutter_e_commerce_c11_online/features/auth/presentation/screens/sign_up/cubit/sign_up_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  var emailController = TextEditingController(text: 'rtyu22@gmail.com');
  var passwordController = TextEditingController(text: 'Rtyu12345');


  LoginViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  // hold data
  // handle logic

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(emailController.text, passwordController.text);

    either.fold((error) {
     emit(LoginErrorState(failures: error));
    }, (response) {
      emit(LoginSuccessState(responseEntity: response));
    });
  }
}
