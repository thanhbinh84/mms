import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mms/blocs/theme/theme_cubit.dart';
import 'package:mms/views/root/screen_router.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenRouter = ScreenRouter();

    return BlocProvider(
        create: (_) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (_, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              onGenerateRoute: screenRouter.generateRoute,
              onUnknownRoute: screenRouter.unknownRoute,
              initialRoute: '/',
            );
          },
        ));
  }
}
