

import 'package:equatable/equatable.dart';

import '../model/login_response_model.dart';


// Key Points:
// LoginState is an abstract class extending Equatable to enable state comparison.
// LoginInitState represents the initial state when no action has been taken.
// LoginLoadingState represents the state when the login process is ongoing.
// LoginLoadedState represents the state after a successful login with the loginResponseModel as a required parameter.
// LoginErrorState represents the state when an error occurs during the login process with the errorMessage as a required parameter.


/// Abstract base class for all login states
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial state when the login process has not started
class LoginInitState extends LoginState {
  @override
  List<Object?> get props => [];
}

/// State when the login process is in progress
class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

/// State when the login process is completed successfully
class LoginLoadedState extends LoginState {
  final LoginResponseModel loginResponseModel;

  /// Constructor with required loginResponseModel parameter
  LoginLoadedState({required this.loginResponseModel});

  @override
  List<Object?> get props => [loginResponseModel];
}

/// State when there is an error during the login process
class LoginErrorState extends LoginState {
  final String errorMessage;

  /// Constructor with required errorMessage parameter
  LoginErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
