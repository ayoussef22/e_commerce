import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/register_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/auth/presentation/screens/sign_up/cubit/sign_up_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  // hold data
  // handle logic

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((error) {
      emit(RegisterErrorState(failures: error));
    }, (response) {
      emit(RegisterSuccessState(responseEntity: response));
    });
  }
}
