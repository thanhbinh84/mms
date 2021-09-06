import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mms/blocs/issues/issues_bloc.dart';
import 'package:mms/blocs/theme/theme_bloc.dart';
import 'package:mms/data/repositories/issue_repos.dart';
import 'package:mms/views/screens/issues_screen.dart';

import '../../mocks/issues_repositories.dart';

Widget makeWidgetTestable({required Widget child}) {
  return MaterialApp(
      home: MultiBlocProvider(
          providers: [
        BlocProvider<IssuesCubit>(
          create: (context) {
            return IssuesCubit(issueRepository: IssueRepository(api: MockAPI()));
          },
        ),
        BlocProvider<ThemeCubit>(
          create: (context) {
            return ThemeCubit();
          },
        ),
      ],
          child: BlocProvider(
              create: (_) => ThemeCubit(),
              child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: theme,
                    home: child,
                    onGenerateRoute: (_) =>
                        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                          return Text('mock page');
                        }));
              }))));
}

void main() {
  testGoldens('Issues list screen should render correctly on multiple screens', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: makeWidgetTestable(child: IssuesScreen()),
        name: 'Issue list screen',
      )
      ..addScenario(
        widget: makeWidgetTestable(child: IssuesScreen()),
        name: 'Dark mode',
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.light),
          );
          expect(finder, findsOneWidget);
          await tester.tap(finder);
        },
      )
      ..addScenario(
        widget: makeWidgetTestable(child: IssuesScreen()),
        name: 'Light mode',
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.light),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
          await tester.tap(finder);
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'multiple_screens_testing');
  });
}
