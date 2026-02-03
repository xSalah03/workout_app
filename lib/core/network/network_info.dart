import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Network information interface
abstract class NetworkInfo {
  /// Check if device is connected to internet
  Future<bool> get isConnected;

  /// Stream of connectivity changes
  Stream<bool> get onConnectivityChanged;
}

/// Network information implementation using connectivity_plus
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  StreamController<bool>? _connectivityController;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkInfoImpl({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity() {
    _init();
  }

  void _init() {
    _connectivityController = StreamController<bool>.broadcast();
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      _connectivityController?.add(_isConnectedFromResults(results));
    });
  }

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return _isConnectedFromResults(results);
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivityController?.stream ?? const Stream.empty();
  }

  bool _isConnectedFromResults(List<ConnectivityResult> results) {
    return results.isNotEmpty &&
        results.any(
          (result) =>
              result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile ||
              result == ConnectivityResult.ethernet,
        );
  }

  /// Dispose resources
  void dispose() {
    _subscription?.cancel();
    _connectivityController?.close();
  }
}
