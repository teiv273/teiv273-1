import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoapp/utilities/dependencies.dart' as dependencies;

class DeleteMemoDialog extends StatefulWidget {
  final int index;
  final Function scrollToBottom;
  const DeleteMemoDialog({
    required this.index,
    required this.scrollToBottom,
    super.key,
  });

  @override
  State<DeleteMemoDialog> createState() => _DeleteMemoDialogState();
}

class _DeleteMemoDialogState extends State<DeleteMemoDialog> {
  RxString status = 'delete-memo'.obs;
  var memoController = TextEditingController();

  Widget deleteMemoWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Delete this memo?',
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                status.value = 'deleting-memo';
              }, child: const Text('Delete')),

              const SizedBox(width: 20),
              ElevatedButton(onPressed: onPressed, child: const Te)
            ],
          )
        ],
      ),
    )
  }
}