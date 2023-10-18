import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_clean_architecture/core/extensions/extensions.dart';

import '../../cubits/theme/theme_cubits.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static ThemeMode selectedValue = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: selectedValue,
          onChanged: (ThemeMode? value) {
            selectedValue = value!;

            context.read<ThemeCubit>().setTheme(themeMode: value);
          },
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System', style: context.settingMenuLabelTextStyle),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light', style: context.settingMenuLabelTextStyle),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark', style: context.settingMenuLabelTextStyle),
            )
          ],
        ),
      ),
    );
  }
}
