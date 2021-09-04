import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mms/blocs/theme/theme_bloc.dart';

class ThemeButtonWidget extends StatefulWidget {
  @override
  _ThemeButtonWidgetState createState() => _ThemeButtonWidgetState();
}

class _ThemeButtonWidgetState extends State<ThemeButtonWidget> {
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _toggleTheme,
        icon: Icon(Icons.light));
  }

  _toggleTheme() {
    _themeCubit.toggleTheme();
  }
}
