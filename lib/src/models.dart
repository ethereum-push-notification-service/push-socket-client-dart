import '../push_socket_client_dart.dart';

class SocketInputOptions {
  final String user;
  final String env;
  final String socketType;
  final SocketOptions socketOptions;

  SocketInputOptions({
    required this.user,
    required this.env,
    required this.socketType,
    required this.socketOptions,
  }) {
    assert(socketType == SOCKETTYPES.NOTIFICATION ||
        socketType == SOCKETTYPES.CHAT);
    assert(env == ENV.DEV ||
        env == ENV.STAGING ||
        env == ENV.PROD ||
        env == ENV.LOCAL);
  }
}

class SocketOptions {
  final bool autoConnect;
  final int reconnectionAttempts;

  SocketOptions({
    this.autoConnect = true,
    this.reconnectionAttempts = 5,
  });
}
