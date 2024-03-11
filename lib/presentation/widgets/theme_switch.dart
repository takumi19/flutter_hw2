import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/presentation/bloc/theme/theme_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (state.switchValue == true) {
              context.read<ThemeBloc>().add(SwitchToLight());
            } else {
              context.read<ThemeBloc>().add(SwitchToDark());
            }
          },
          icon: state.switchValue == true
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
        );
      },
    );
  }
}
