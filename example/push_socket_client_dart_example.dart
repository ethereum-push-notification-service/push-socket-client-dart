import 'package:push_socket_client_dart/push_socket_client_dart.dart';

void main() {
  final options = SocketInputOptions(
    user: '0x08f890A796E757714c3472032383634565aF6044',
    env: ENV.DEV,
    socketType: SOCKETTYPES.NOTIFICATION,
    socketOptions: SocketOptions(
      autoConnect: true,
      reconnectionAttempts: 5,
    ),
  );
  final pushSocket = createSocketConnection(options);
  print('Result: $pushSocket');

  if (pushSocket != null) {
    pushSocket.connect();

    pushSocket.on(
      EVENTS.CONNECT,
      (data) {
        print(' EVENTS.CONNECT: $data');
      },
    );
    pushSocket.on(
      EVENTS.CHAT_RECEIVED_MESSAGE,
      (data) {
        print(' EVENTS.CHAT_RECEIVED_MESSAGE: $data');
      },
    );
    pushSocket.on(
      EVENTS.CHAT_GROUPS,
      (data) {
        print(' EVENTS.CHAT_GROUPS: $data');
      },
    );
    pushSocket.on(
      EVENTS.USER_FEEDS,
      (data) {
        print(' EVENTS.USER_FEEDS: $data');
      },
    );
    pushSocket.on(
      EVENTS.USER_SPAM_FEEDS,
      (data) {
        print(' EVENTS.USER_SPAM_FEEDS: $data');
      },
    );
    pushSocket.on(
      EVENTS.DISCONNECT,
      (data) {
        print(' EVENTS.DISCONNECT: $data');
      },
    );
  }
}
