import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../push_socket_client_dart.dart';

io.Socket? createSocketConnection(SocketInputOptions options) {
  final pushWSUrl = Api.getAPIBaseUrls(options.env);
  try {
    final String userAddressInCAIP = options.socketType == 'chat'
        ? walletToPCAIP10(options.user)
        : getCAIPAddress(options.env, options.user, 'User');
    Map<String, dynamic>? query;
    if (options.socketType == 'notification') {
      query = {'address': userAddressInCAIP};
    } else {
      query = {'mode': 'chat', 'did': userAddressInCAIP};
    }

    io.Socket socket = io.io(
      pushWSUrl,
      {
        ...io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setReconnectionAttempts(options.socketOptions.reconnectionAttempts)
            .setQuery(query)
            .build(),
      },
    );
    return socket;
  } catch (e) {
    print('[PUSH-SDK] - Socket connection error: $e');
    return null;
  }
}
