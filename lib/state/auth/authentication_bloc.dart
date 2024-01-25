import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/data/model/user.dart';
import 'package:tontineo_mobile_app/data/services/authentication.dart';
import 'package:tontineo_mobile_app/data/services/user.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_Event.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();
  final UserService userService = UserService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signUpUser(event.email, event.password);
        if (user != null) {
          // add user to firestore
          await userService.addUserToCollection(
              user.id.toString(), event.username, event.email, event.phone);
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignInUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signInUser(event.email, event.password);
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('sign in failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<GetUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final Future<UserModel?> user = authService.getCurrentUser();
        emit(AuthenticationSuccessState(user as UserModel));
      } catch (e) {
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}
