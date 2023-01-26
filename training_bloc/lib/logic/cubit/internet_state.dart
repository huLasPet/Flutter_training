part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class WifiConnected extends InternetState {
  final ConnectionType connectionType;

  WifiConnected({required this.connectionType});
}

class MobileConnected extends InternetState {}

class InternetDisconnected extends InternetState {}
