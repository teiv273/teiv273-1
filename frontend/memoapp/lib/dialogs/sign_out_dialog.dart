import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoapp/utilities/dependencies.dart' as dependencies;

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        'Sign out?',
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.find<dependencies.AuthController>().signOut();
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
