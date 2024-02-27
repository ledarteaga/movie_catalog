import 'package:flutter/material.dart';

class BackdropOverlay extends StatelessWidget {
  const BackdropOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0)
            ]),
      )),
    );
  }
}
