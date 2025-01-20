import 'package:deenthusiast/domain/models/params/params.dart';
import 'package:deenthusiast/domain/repository/advice_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(const HomeState());

  final AdviceRepository repository;

  Future<void> registerAdviceUser() async {
    try {
      await repository.registerAdviceUser(state.param);
    } catch (_) {}
  }

  void onNameUpdate(String name) {
    emit(state.copyWith(state.param.copyWith(name: name)));
  }

  void onAddressUpdate(String address) {
    emit(state.copyWith(state.param.copyWith(address: address)));
  }

  void onEmailUpdate(String email) {
    emit(state.copyWith(state.param.copyWith(email: email)));
  }

  void onGenderUpdate(bool isMale) {
    emit(state.copyWith(state.param.copyWith(isMale: !isMale)));
  }
}
