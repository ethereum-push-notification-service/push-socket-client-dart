
<h1 align="center">
    <a href="https://push.org/#gh-light-mode-only">
    <img width='20%' height='10%' 
src="https://res.cloudinary.com/drdjegqln/image/upload/v1686227557/Push-Logo-Standard-Dark_xap7z5.png">
    </a>

</h1>

<p align="center">
  <i align="center">Push Protocol is a web3 communication network, enabling cross-chain notifications, messaging, video, and NFT chat for dapps, wallets, and services.🚀</i>
</p>

<h4 align="center">

  <a href="https://discord.com/invite/pushprotocol">
    <img src="https://img.shields.io/badge/discord-7289da.svg?style=flat-square" alt="discord">
  </a>
  <a href="https://twitter.com/pushprotocol">
    <img src="https://img.shields.io/badge/twitter-18a1d6.svg?style=flat-square" alt="twitter">
  </a>
  <a href="https://www.youtube.com/@pushprotocol">
    <img src="https://img.shields.io/badge/youtube-d95652.svg?style=flat-square&" alt="youtube">
  </a>
</h4>
</h1>
<h2>Push Dart Socket Client </h2> 
<p>
This package helps to connect to Push backend using websockets built on top of Socket.IO

</p>
</div>


## 📚 Table of Contents
- [Documentation](#documentation)
- [Getting Started](#-getting-started)
- [Resources](#resources)
- [Contributing](#contributing)

---


## Documentation
 Visit [Developer Docs](https://docs.push.org/developers/developer-tooling/push-sdk/sdk-packages-details/pushprotocol-socket) or [Push.org](https://push.org) to learn more.


## 🚀 Getting Started

### 🖥 Installation
 Add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):
```yaml
dependencies:
  push_socket_client_dart: ^0.0.1-alpha
```
Alternatively, your editor might support ```dart pub get``` or ```flutter pub get```. Check the docs for your editor to learn more.

Try it:
```dart
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
 ```


---

## Resources
- **[Website](https://push.org)** To checkout our Product.
- **[Docs](https://docs.push.org/developers/)** For comprehensive documentation.
- **[Blog](https://medium.com/push-protocol)** To learn more about our partners, new launches, etc.
- **[Discord](discord.gg/pushprotocol)** for support and discussions with the community and the team.
- **[GitHub](https://github.com/ethereum-push-notification-service)** for source code, project board, issues, and pull requests.
- **[Twitter](https://twitter.com/pushprotocol)** for the latest updates on the product and published blogs.


## Contributing

Push Protocol is an open source Project. We firmly believe in a completely transparent development process and value any contributions. We would love to have you as a member of the community, whether you are assisting us in bug fixes, suggesting new features, enhancing our documentation, or simply spreading the word. 

- Bug Report: Please create a bug report if you encounter any errors or problems while utilising the Push Protocol.
- Feature Request: Please submit a feature request if you have an idea or discover a capability that would make development simpler and more reliable.
- Documentation Request: If you're reading the Push documentation and believe that we're missing something, please create a docs request.


Read how you can contribute <a href="https://github.com/ethereum-push-notification-service/push-sdk/blob/main/contributing.md">HERE</a>

Not sure where to start? Join our discord and we will help you get started!


<a href="https://discord.gg/pushprotocol" title="Join Our Community"><img src="https://www.freepnglogos.com/uploads/discord-logo-png/playerunknown-battlegrounds-bgparty-15.png" width="200" alt="Discord" /></a>

## License
Check out our License <a href='https://github.com/ethereum-push-notification-service/push-swift-sdk/blob/main/license-v1.md'>HERE </a>