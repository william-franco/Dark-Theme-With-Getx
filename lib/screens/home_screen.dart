import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:dark_theme_with_getx/routes/routes.dart';
import 'package:dark_theme_with_getx/widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final String title = 'Dark Theme With Getx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithActions(
        context,
        title,
        actions: _actions(context),
      ),
      body: _buildBody(context),
    );
  }

  List<Widget> _actions(context) {
    return [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () => Get.toNamed(Routes.setting),
      ),
    ];
  }

  Widget _buildBody(context) {
    return CupertinoScrollbar(
      child: SafeArea(
        child: ListView.separated(
          itemCount: 201,
          separatorBuilder: (context, index) => Divider(height: 15),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                horizontalOffset: 48.0,
                child: FadeInAnimation(
                  child: Ink(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('$index'),
                      ),
                      title: Text('Item $index'),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
