import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mms/blocs/theme/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => BlocProvider.of<ThemeCubit>(context).toggleTheme(),
        icon: Icon(Icons.light));
  }
}
