import 'package:flutter/material.dart';

class BatteryField extends StatelessWidget {
  final int percentage;
  final int maxmAh = 5000;
  final bool showPercentageLabel;

  const BatteryField({
    Key? key,
    required this.percentage,
    this.showPercentageLabel = false,
  }) : super(key: key);

  int calculatemAhFromPercentage(int percentage) {
    return (percentage / 100 * maxmAh).floor();
  }

  @override
  Widget build(BuildContext context) {
    final mAh = calculatemAhFromPercentage(percentage);

    String text;
    if (showPercentageLabel) {
      text = 'Send: $percentage%';
    } else {
      text = 'Request: $percentage%     $mAh mAh';
    }

    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class BatteryPopup extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onChanged;

  const BatteryPopup({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  BatteryPopupState createState() => BatteryPopupState();
}

class BatteryPopupState extends State<BatteryPopup> {
  late int _batteryPercentage;

  @override
  void initState() {
    super.initState();
    _batteryPercentage = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 240,
        width: 240,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Battery Percentage',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Slider(
              value: _batteryPercentage.toDouble(),
              min: 5,
              max: 20,
              divisions: 5,
              onChanged: (double value) {
                setState(() {
                  _batteryPercentage = value.toInt();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onChanged(_batteryPercentage);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
