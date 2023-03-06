import 'package:flutter/material.dart';

alertPassword(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text(msg),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black, fontSize: 20),
                
              ),
            ),
          ],
          alignment: Alignment.center,
        );
      });
}
