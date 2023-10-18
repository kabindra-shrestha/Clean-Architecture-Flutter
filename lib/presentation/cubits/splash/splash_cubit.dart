import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.loading());

  void isAuthenticatedUserCheck() async {
    const bool authenticated = false;

    Future.delayed(const Duration(seconds: 1), () {
      authenticated!
          ? emit(const SplashState.authenticate())
          : emit(const SplashState.unAuthenticatedState());
    });
  }
}
