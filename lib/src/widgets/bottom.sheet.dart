library shared_utils;

import 'package:flutter/material.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

void showCustomBottomSheet(BuildContext context, Widget child,
    [bool onlyWidget = false]) {
  final SheetController sheetController = SheetController();

  showSlidingBottomSheet<void>(
    context,
    builder: (BuildContext context) {
      return SlidingSheetDialog(
        controller: sheetController,
        elevation: 8,
        cornerRadius: 16,
        extendBody: true,
        snapSpec: const SnapSpec(
          snappings: <double>[1, 1, 1.0],
        ),
        builder: (BuildContext context, SheetState state) {
          return onlyWidget
              ? child
              : Material(
                  child: SingleChildScrollView(
                    child: child,
                  ),
                );
        },
      );
    },
  );
}
