import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin CommonWidgets {
  Future<void> showAlert(BuildContext context,
      {String title, @required String body, Function onTap}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 15),
            textDirection: TextDirection.rtl,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SelectableText(
                  body,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onTap();
              },
            ),
          ],
        );
      },
    );
  }
}