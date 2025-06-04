import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast extends StatefulWidget {
  const Toast({super.key});

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Displays a toast message when the button is pressed
            Fluttertoast.showToast(
              fontSize: 20,
              gravity: ToastGravity.TOP,
              msg: 'Hello this is a toast', // Message to display in the toast
              backgroundColor: Colors.green,
              textColor: Colors.white, // Background color of the toast
            );
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            color: Colors.green,
            child: const Text(
              'Show Toast',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
