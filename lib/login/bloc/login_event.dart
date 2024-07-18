import 'package:equatable/equatable.dart';

import '../model/login_request_model.dart';


// Key Points:
// LoginEvent is an abstract class extending Equatable to enable event comparison.
// LoginRequestEvent represents the event to initiate a login request with the required loginRequestModel parameter.

/// Abstract base class for all login events
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event for initiating a login request
class LoginRequestEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;

  /// Constructor for LoginRequestEvent with a required loginRequestModel parameter
  LoginRequestEvent({required this.loginRequestModel});

  @override
  List<Object?> get props => [loginRequestModel];
}
