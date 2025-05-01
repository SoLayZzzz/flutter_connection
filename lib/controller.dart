import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionController extends GetxController {
  final isConnected = true.obs;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();

    _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (results.isNotEmpty) {
        _updateConnection(results.first);
      } else {
        _updateConnection(ConnectivityResult.none);
      }
    });
  }

  Future<void> _checkInitialConnection() async {
    final List<ConnectivityResult> results =
        await _connectivity.checkConnectivity();
    if (results.isNotEmpty) {
      _updateConnection(results.first);
    } else {
      _updateConnection(ConnectivityResult.none);
    }
  }

  void _updateConnection(ConnectivityResult result) {
    final hasConnection = result != ConnectivityResult.none;

    if (isConnected.value != hasConnection) {
      isConnected.value = hasConnection;

      print(
        hasConnection
            ? "🟢🟢🟢 ====>>  Connected to the Internet"
            : "🔴🔴🔴 ====>>   No Internet Connection",
      );

      Get.snackbar(
        hasConnection ? "Internet Connected" : "No Internet",
        hasConnection ? "You are online" : "You are offline",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
