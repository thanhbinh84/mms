import 'package:flutter/material.dart';
import 'package:mms/screen_router.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenRouter = ScreenRouter();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            platform: TargetPlatform.iOS,
            bottomSheetTheme: BottomSheetThemeData(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
            appBarTheme: AppBarTheme(
              elevation: .5,
            ),
            // for checkbox
            fontFamily: 'Avenir',
            dividerTheme: DividerThemeData(thickness: 1)),
        onGenerateRoute: screenRouter.generateRoute,
        onUnknownRoute: screenRouter.unknownRoute,
        initialRoute: '/',
    );
  }
}
