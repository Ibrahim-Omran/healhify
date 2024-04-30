abstract class ProfileState{}

final class ProfileInitial extends ProfileState{}

final class ProfileLoadingState extends ProfileState{}
final class ProfileSuccessState extends ProfileState{}
final class ProfileErrorState extends ProfileState{}


final class LogoutLoadingState extends ProfileState{}
final class LogoutSuccessState extends ProfileState{}
final class LogoutErrorState extends ProfileState{}
