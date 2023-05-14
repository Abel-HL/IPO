

class BatteryInfo {
  static final BatteryInfo _instance = BatteryInfo._internal();

  factory BatteryInfo() {
    return _instance;
  }

  BatteryInfo._internal();

  int batteryPercentage = 80; // Valor inicial de la batería
}


class SendPercentageInfo {
  static final SendPercentageInfo _instance = SendPercentageInfo._internal();

  factory SendPercentageInfo() {
    return _instance;
  }

  SendPercentageInfo._internal();

  int sendPercentage = 10; // Valor inicial de la batería
}

class RequestPercentageInfo {
  static final RequestPercentageInfo _instance = RequestPercentageInfo._internal();

  factory RequestPercentageInfo() {
    return _instance;
  }

  RequestPercentageInfo._internal();

  int requestPercentage = 10; // Valor inicial de la batería
}


