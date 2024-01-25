import 'package:tontineo_mobile_app/data/model/user.dart';

abstract class UserState {
  const UserState();

  List<Object> get props =>
      []; // This method is used for equality checking when comparing instances of this class.
}

class UserDetailsInitialState extends UserState {}

class UserDetailsLoadingState extends UserState {
  final bool isLoading;

  UserDetailsLoadingState({required this.isLoading});
}

class UserDetailsSuccessState extends UserState {
  final UserModel user;

  const UserDetailsSuccessState(this.user);
  @override
  List<Object> get props => [user];
}

class UserDetailsFailureState extends UserState {
  final String errorMessage;

  const UserDetailsFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
