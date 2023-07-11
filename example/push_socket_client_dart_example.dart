

import 'package:push_socket_client_dart/push_socket_client_dart.dart';

void main() {
  final options = SocketInputOptions(
    user: '0x08f890A796E757714c3472032383634565aF6044',
    env: ENV.DEV,
    socketType: 'notification',
    apiKey: '',
    socketOptions: SocketOptions(),
  );
  final r = createSocketConnection(options);
  print('REsult: $r');

  if (r != null) {
    r.connect();

    r.on(
      EVENTS.CONNECT,
      (data) {
        print(' EVENTS.CONNECT: $data');
      },
    );
    r.on(
      EVENTS.CHAT_RECEIVED_MESSAGE,
      (data) {
        print(' EVENTS.CHAT_RECEIVED_MESSAGE: $data');
      },
    );
    r.on(
      EVENTS.CHAT_GROUPS,
      (data) {
        print(' EVENTS.CHAT_GROUPS: $data');
      },
    );
    r.on(
      EVENTS.USER_FEEDS,
      (data) {
        print(' EVENTS.USER_FEEDS: $data');
      },
    );
    r.on(
      EVENTS.USER_SPAM_FEEDS,
      (data) {
        print(' EVENTS.USER_SPAM_FEEDS: $data');
      },
    );
    r.on(
      EVENTS.DISCONNECT,
      (data) {
        print(' EVENTS.DISCONNECT: $data');
      },
    );
  }
}
