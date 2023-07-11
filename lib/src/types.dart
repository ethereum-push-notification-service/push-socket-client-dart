class SocketInputOptions {
  final String user;
  final String env;
  final String socketType;
  final String apiKey;
  final SocketOptions socketOptions;

  ///socketType ='notification' | 'chat',
  SocketInputOptions({
    required this.user,
    required this.env,
    required this.socketType,
    required this.apiKey,
    required this.socketOptions,
  }) {
    assert(socketType == 'notification' || socketType == 'chat');
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
