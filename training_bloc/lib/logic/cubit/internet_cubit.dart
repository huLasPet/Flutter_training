import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:training_bloc/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity})
      : super(
          InternetLoading(connectionType: ConnectionType.loading),
        ) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.mobile) {
          emitInternetConnected(ConnectionType.mobile);
        } else if (result == ConnectivityResult.wifi) {
          emitInternetConnected(ConnectionType.wifi);
        } else {
          emitInternetDisconnect(ConnectionType.offline);
        }
      },
    );
  }

  void emitInternetConnected(ConnectionType connectionType) {
    emit(WifiConnected(connectionType: connectionType));
  }

  void emitMobileConnect(connectionType) =>
      emit(MobileConnected(connectionType: connectionType));

  void emitInternetDisconnect(connectionType) =>
      emit(InternetDisconnected(connectionType: connectionType));

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
