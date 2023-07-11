import '../push_socket_client_dart.dart';

class Api {
  static String getAPIBaseUrls(String env) {
    return Api._apiBaseUrlMap[env] ?? 'http://localhost:4000/apis';
  }

  static final Map<String, String> _apiBaseUrlMap = {
    ENV.PROD: 'https://backend.epns.io',
    ENV.STAGING: 'https://backend-staging.epns.io',
    ENV.DEV: 'https://backend-dev.epns.io',

    ///This is for local development only**
    ENV.LOCAL: 'http://localhost:4000',
  };
}
