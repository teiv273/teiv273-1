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
  })
}
