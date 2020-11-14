import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigate {
  static Future pushPage(BuildContext context, Widget page) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
    return val;
  }
}
