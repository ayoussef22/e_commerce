import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/color_manager.dart';


class DialogUtils {
  static Future<void> showLoading(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {


          return AlertDialog(
            backgroundColor: ColorManager.containerGray,
            content: const Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 13),
                  child: Text('Loading ...'),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<void> showMessage(BuildContext context, String content,
      {String title = '',
      String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction}) async {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorManager.containerGray,
            title: Text(title),
            titleTextStyle: Theme.of(context).textTheme.titleMedium,
            content: Text(content),
            actions: actions,
          );
        });
  }
}
