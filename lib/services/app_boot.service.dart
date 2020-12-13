import 'package:flutter_boilerplate/common/apollo_client.dart';
import 'package:momentum/momentum.dart';
import 'package:flutter_boilerplate/common/queries.dart';
import 'package:graphql/client.dart';

// Services can be used for a plethora of actions.
// Services can be associated to a controller as well. Just add .service suffix to make this association. This is just a convention to follow. Not mandatory.
// Here we will be using services to handle api calls.

class AppBootService extends MomentumService {
  Future makeAQuery() async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(readRepositories),
      variables: <String, dynamic>{
        'nRepositories': 50,
      },
    );

    final QueryResult result = await Session.shared.client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }
  }
}
