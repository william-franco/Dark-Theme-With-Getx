import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dark_theme_with_getx/controllers/theme_controller.dart';
import 'package:dark_theme_with_getx/widgets/appbar_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  final String title = 'Settings';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late ThemeMode _themeMode;

  Future<void> _showMyDialog() async {
    _themeMode = ThemeController.to.themeMode;
    return Get.defaultDialog(
      title: 'Select theme',
      content: SingleChildScrollView(
        child: Column(
          children: [
            RadioListTile(
              title: Text('System'),
              value: ThemeMode.system,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  ThemeController.to.setThemeMode(_themeMode);
                });
                Get.back();
              },
            ),
            RadioListTile(
              title: Text('Dark'),
              value: ThemeMode.dark,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  ThemeController.to.setThemeMode(_themeMode);
                });
                Get.back();
              },
            ),
            RadioListTile(
              title: Text('Light'),
              value: ThemeMode.light,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  ThemeController.to.setThemeMode(_themeMode);
                });
                Get.back();
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBack(context, widget.title),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    return CupertinoScrollbar(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
              subtitle: Text('Choose a theme for the app.'),
              onTap: () => _showMyDialog(),
            ),
          ],
        ),
      ),
    );
  }
}
