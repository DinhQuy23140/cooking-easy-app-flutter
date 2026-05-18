
import 'package:cooking_easy/features/main/domain/repository/userRepository.dart';
import 'package:cooking_easy/features/main/presentation/state/api_state.dart';
import 'package:flutter/cupertino.dart';

class Myprofileviewmodel {
  UserRepository _userRepository;
  Myprofileviewmodel(this._userRepository);

  ValueNotifier<ApiState<bool>> isLoading = ValueNotifier(ApiLoading());

  Future<void> logout() async {
    try {
      isLoading.value = ApiLoading();
      await _userRepository.logout();
      isLoading.value = ApiSuccess(true);
    } catch (e) {
      isLoading.value = ApiError(e.toString());
    }
  }
}