abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;
  final String phone;
  final String username;
  final String selectedUserType;

  const SignUpUser(
    this.email,
    this.password,
    this.phone,
    this.username,
    this.selectedUserType,
  );

  @override
  List<Object> get props => [email, password, phone, username];
}

class SignOut extends AuthenticationEvent {}

class SignInUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class GetUser extends AuthenticationEvent {}
