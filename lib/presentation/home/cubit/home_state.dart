part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ParamRegisterAdviceUser param;

  const HomeState({
    this.param = const ParamRegisterAdviceUser(),
  });

  HomeState copyWith(
    ParamRegisterAdviceUser? param,
  ) {
    return HomeState(
      param: param ?? this.param,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [param];
}
