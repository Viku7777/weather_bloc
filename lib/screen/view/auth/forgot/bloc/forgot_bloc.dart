import 'package:bloc/bloc.dart';
import 'package:weather_app/repository/repository.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotInitial()) {
    on<ForgotPasswordEvent>(_forgotPassword);
  }
  void _forgotPassword(
      ForgotPasswordEvent event, Emitter<ForgotState> emit) async {
    emit(ForgotLoading());
    await FirebaseRepository.forgotPassword(event.email)
        .then((value) => emit(ForgotSuccess()))
        .onError(
            (error, stackTrace) => emit(ForgotErrorState(error.toString())));
  }
}
