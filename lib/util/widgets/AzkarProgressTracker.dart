import 'package:flutter/material.dart';

class AzkarProgressTracker extends StatelessWidget {
  const AzkarProgressTracker({
    super.key,
    required this.indx,
    required this.maxsteps,
  });

  final int maxsteps;
  final int indx;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: indx / maxsteps,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }
}
