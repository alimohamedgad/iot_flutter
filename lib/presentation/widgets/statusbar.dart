import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final String statusMessage;

  const StatusBar({
    super.key,
    required this.statusMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.deepOrangeAccent,
            child: Text(
              statusMessage,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
