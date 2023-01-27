part of 'internet_cubit.dart';

abstract class InternetState {
  ConnectionType connectionType = ConnectionType.loading;
  InternetState({required this.connectionType});
}

class InternetLoading extends InternetState {
  InternetLoading({required super.connectionType});
}

class WifiConnected extends InternetState {
  WifiConnected({required super.connectionType});
}

class MobileConnected extends InternetState {
  MobileConnected({required super.connectionType});
}

class InternetDisconnected extends InternetState {
  InternetDisconnected({required super.connectionType});
}
