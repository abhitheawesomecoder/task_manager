import 'package:flutter/material.dart';

dynamic viewDialog(BuildContext context, String detail) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail'),
          content: Text(detail),
        );
      });
}
