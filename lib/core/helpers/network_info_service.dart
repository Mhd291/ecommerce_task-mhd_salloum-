import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfoService {
  Future<bool> get isConnected;
}

class NetworkInfoServiceImpl implements NetworkInfoService {

  final InternetConnectionChecker _connectionChecker;

  NetworkInfoServiceImpl(this._connectionChecker);

  @override
  Future<bool> get isConnected async {
    return await _connectionChecker.hasConnection;
  }
}