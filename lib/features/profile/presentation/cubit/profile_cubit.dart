import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tcc/core/session/session_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SessionManager sessionManager;

  ProfileCubit({required this.sessionManager}) : super(ProfileInitialState());
}
