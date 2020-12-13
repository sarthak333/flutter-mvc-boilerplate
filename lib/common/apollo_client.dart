import 'package:graphql/client.dart';

// Singleton class to handle data that will be used throughout the app in a session.
// This data will not persist between different sessions.
class Session {
  static final Session _singleton = Session._internal();
  factory Session() => _singleton;
  Session._internal();
  static Session get shared => _singleton;

  GraphQLClient client;
}

// Setup the apollo client on boot
void setupApolloClient(token) {
  final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AuthLink(
    getToken: () async => 'access_token=$token',
  );

// catch all errors from graphql here
  final ErrorLink errorLink = ErrorLink(errorHandler: (ErrorResponse response) {
    Operation operation = response.operation;
    FetchResult result = response.fetchResult;
    OperationException exception = response.exception;
    print(exception.toString());
  });

  final Link _link = Link.from([_authLink, _httpLink, errorLink]);

  final GraphQLClient _client =
      GraphQLClient(cache: InMemoryCache(), link: _link);

// Make the same instance of the client available throughout the app.
  Session.shared.client = _client;
}
