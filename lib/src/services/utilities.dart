import 'dart:io';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class Utilities {
  String getFileSize(File file) {
    final int size = file.lengthSync();
    return filesize(size);
  }

  static String? getFileType(File file) {
    final String type = file.path.split('/').last;
    final String? mimeType = lookupMimeType(type);
    return mimeType;
  }

  static String dateFormat(DateTime date) {
    return DateFormat('d-MMM-yyyy').format(date);
  }

  static String newdateFormat(DateTime date) {
    return DateFormat('yyyy-M-dd').format(date);
  }

  static String fullDateFormat(DateTime date) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  }

  static String yearMD(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String mDY(DateTime date) {
    return DateFormat('MM-dd-yyyy').format(date);
  }

  static String phoneNumber(String number) {
    return '0$number';
  }

  static String formatAmounts(String amt) {
    String formattedAmt;
    final NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');
    // final formatter = new NumberFormat.simpleCurrency();

    if (amt == null || amt.isEmpty || amt == '0') {
      amt = '0.00';

      formattedAmt = amt;
    } else {
      final double amtDouble = double.parse(amt);
      formattedAmt = formatter.format(amtDouble);
    }

    return formattedAmt;
  }

  static List<Color> randomColors() {
    const List<Color> allColors = <Color>[
      Colors.black,
      Colors.red,
      Colors.green,
      Colors.yellow,

      Colors.blue,
      Colors.teal,
      Colors.purple,

      Colors.pink,
      Colors.orange,
      Colors.brown,
      Colors.grey,
      Colors.indigo,
      Colors.cyan,
      Colors.lime,
      Colors.indigoAccent,
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.redAccent,
      Colors.yellowAccent,
      Colors.tealAccent,
      Colors.purpleAccent,
      Colors.pinkAccent,
      Colors.orangeAccent,

      Colors.black54,
      Colors.black45,

      // Colors.black26,
      // Colors.black12,
      // Colors.black87,
      // Colors.black38,
    ];
    return allColors;
  }
}
