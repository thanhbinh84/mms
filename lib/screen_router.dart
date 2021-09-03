import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mms/blocs/issues/issues_bloc.dart';
import 'package:mms/graphql/api.dart';
import 'package:mms/repositories/issue_repos.dart';
import 'package:mms/views/screens/issue_detail_screen.dart';
import 'package:mms/views/screens/issues_screen.dart';

class ScreenRouter {
  static const ROOT = '/';
  static const ISSUE_DETAILS = 'ISSUE_DETAILS';

  // ARGUMENTS
  static const ARG_ISSUE = 'ISSUE';

  late IssueRepository issueRepository;
  late BaseAPI api;

  ScreenRouter() {
    api = API.instance;

    issueRepository = IssueRepository(api: api);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    var route = buildPageRoute(settings);
    Map? arguments = settings.arguments as Map;

    print('>>>>>>> GOTO: ${settings.name}');
    switch (settings.name) {
      case ROOT:
        return route(IssuesScreen());
      case ISSUE_DETAILS:
        return route(IssueDetailsScreen(issue: arguments[ARG_ISSUE]));
      default:
        return unknownRoute(settings);
    }
  }

  Function buildPageRoute(RouteSettings settings) {
    List<BlocProvider> blocProviders = [
      BlocProvider<IssuesCubit>(
        create: (context) => IssuesCubit(
          issueRepository: issueRepository,
        ),
      ),
    ];

    return (Widget child, {fullScreen = false}) => MaterialPageRoute(
          fullscreenDialog: fullScreen,
          builder: (context) => MultiBlocProvider(
            providers: blocProviders,
            child: child,
          ),
          settings: settings,
        );
  }

  Route<dynamic> unknownRoute(RouteSettings settings) {
    var unknownRouteText = "No such screen for ${settings.name}";

    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(unknownRouteText),
          Padding(padding: const EdgeInsets.all(10.0)),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Back'),
          ),
        ],
      );
    });
  }
}
