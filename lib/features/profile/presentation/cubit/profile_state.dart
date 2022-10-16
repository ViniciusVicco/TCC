part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {
  final String profileUrlImage;
  const ProfileInitialState({this.profileUrlImage = ""});
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
}
