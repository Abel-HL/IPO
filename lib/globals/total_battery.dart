

class BatteryInfo {
  static final BatteryInfo _instance = BatteryInfo._internal();

  factory BatteryInfo() {
    return _instance;
  }

  BatteryInfo._internal();

  int batteryPercentage = 80; // Valor inicial de la batería
}