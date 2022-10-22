import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momento/business_logic/providers/providers.dart';

class CustomCupertinoSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        ThemeMode themeMode = watch(ThemeManagerProvider).currentThemeMode;
        return CupertinoSwitch(
          
            value: themeMode == ThemeMode.dark,
            onChanged: (isLight) {
              context
                  .read(ThemeManagerProvider)
                  .changeTheme(isLight ? ThemeMode.dark : ThemeMode.light);
            },
            activeColor: Theme.of(context).accentColor,
            );
      },
    );
  }
}
