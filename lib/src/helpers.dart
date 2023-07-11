import 'package:ethereum_addresses/ethereum_addresses.dart';

import '../push_socket_client_dart.dart';

bool isValidETHAddress(String address) {
  return isValidEthereumAddress(address);
}

final Map<String, Function> addressValidators = {
  // Ethereum
  'eip155': ({required String address}) {
    return isValidETHAddress(address);
  },
  // Add other chains here
};

bool validateCAIP(String addressInCAIP) {
  List<String> parts = addressInCAIP.split(':');
  if (parts.length < 3) return false;

  String blockchain = parts[0];
  String networkId = parts[1];
  String address = parts[2];

  if (blockchain.isEmpty) return false;
  if (networkId.isEmpty) return false;
  if (address.isEmpty) return false;

  if (isValidCAIP10NFTAddress(addressInCAIP)) return true;

  Function? validatorFn = addressValidators[blockchain];

  if (validatorFn != null) {
    return validatorFn({'address': address});
  }

  return false;
}

bool isValidCAIP10NFTAddress(String wallet) {
  try {
    List<String> walletComponent = wallet.split(':');
    return walletComponent.length == 5 ||
        walletComponent.length == 6 &&
            walletComponent[0].toLowerCase() == 'nft' &&
            double.tryParse(walletComponent[4]) != null &&
            double.parse(walletComponent[4]) > 0 &&
            double.tryParse(walletComponent[2]) != null &&
            double.parse(walletComponent[2]) > 0 &&
            isValidEthereumAddress(walletComponent[3]) &&
            walletComponent[1] == 'eip155';
  } catch (err) {
    return false;
  }
}

String getFallbackETHCAIPAddress(String env, String address) {
  int chainId = 1; // by default PROD

  if (env == ENV.DEV || env == ENV.STAGING) {
    chainId = 5;
  }

  return 'eip155:$chainId:$address';
}

/// This helper
///  checks if a VALID CAIP
///    return the CAIP
///  else
///    check if valid ETH
///      return a CAIP representation of that address (EIP155 + env)
///    else
///      throw error!
String getCAIPAddress(String env, String address, [String? msg]) {
  if (validateCAIP(address)) {
    return address;
  } else {
    if (isValidETHAddress(address)) {
      return getFallbackETHCAIPAddress(env, address);
    } else {
      throw Exception('Invalid Address! $msg');
    }
  }
}

String walletToPCAIP10(String account) {
  if (account.contains('eip155:')) {
    return account;
  }
  return 'eip155:$account';
}
