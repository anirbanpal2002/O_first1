import 'package:flutter/material.dart';

/// Flutter code sample for [AlertDialog].

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Alert",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed:
                () => showDialog<String>(
                  context: context,
                  builder:
                      (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                ),
            child: const Text(
              'Show Dialog',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
