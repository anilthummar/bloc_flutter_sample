
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_response_model.dart';
import '../repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';


// Key Points:
// LoginBloc class inherits from Bloc and handles login events (LoginEvent) and states (LoginState).
// The initial state is set to LoginInitState.
// When a LoginRequestEvent is triggered, the on<LoginRequestEvent> method handles it by:
// Emitting a LoginLoadingState to indicate the login process has started.
// Attempting to login using LoginRepository and the provided credentials.
// Emitting either a LoginLoadedState with the response or a LoginErrorState with the error message in case of an exception.



/// BLoC class for handling login events and states
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  /// Initial state is set to LoginInitState
  LoginBloc() : super(LoginInitState()) {

    /// Event handler for login requests
    on<LoginRequestEvent>((event, emit) async {

      /// Emit a loading state to indicate the login process has started
      emit(LoginLoadingState());

      try {
        /// Perform the login API call using the provided username and password
        LoginResponseModel loginResponseModel = await LoginRepository().login(
          event.loginRequestModel.username ?? "",
          event.loginRequestModel.password ?? "",
        );

        /// Emit a loaded state with the response from the login API call
        emit(LoginLoadedState(loginResponseModel: loginResponseModel));

      } catch (e) {
        /// Emit an error state with the error message in case of an exception
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}
