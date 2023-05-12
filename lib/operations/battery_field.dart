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
        height: 220,
        width: 220,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Battery',
              style: TextStyle(
                color: Color(0xFF075E95),
                fontSize: 24,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Percentage: $_batteryPercentage%',
              style: const TextStyle(
                color: Color(0xFF075E95),
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Capacity: ${(5000 * _batteryPercentage / 100).toStringAsFixed(0)} mAh',
              style: const TextStyle(
                color: Color(0xFF075E95),
                fontFamily: 'Nunito',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Slider(
              value: _batteryPercentage.toDouble(),
              min: 5,
              max: 20,
              divisions: 3,
              activeColor: const Color(0xFF075E95),
              onChanged: (double value) {
                setState(() {
                  _batteryPercentage = value.toInt();
                });
              },
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.2), // Color de fondo del botón
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Espaciado interno del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados del botón
                    ),
                  ),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onChanged(_batteryPercentage);
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:const Color(0xFF075E95).withOpacity(0.3), // Color de fondo con opacidad reducida
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Color(0xFF075E95),
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
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
