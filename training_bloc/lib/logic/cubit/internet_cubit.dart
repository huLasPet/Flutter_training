import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:training_bloc/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  ConnectionType connectionType2 = ConnectionType.mobile;

  InternetCubit({required this.connectivity})
      : super(
          InternetLoading(),
        ) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.mobile) {
          connectionType2 = ConnectionType.wifi;
          emitInternetConnected(ConnectionType.mobile);
        } else if (result == ConnectivityResult.wifi) {
          connectionType2 = ConnectionType.wifi;
          emitInternetConnected(ConnectionType.wifi);
        } else {
          emitInternetDisconnect();
        }
      },
    );
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(WifiConnected(connectionType: connectionType));

  void emitMobileConnect() => emit(MobileConnected());

  void emitInternetDisconnect() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
