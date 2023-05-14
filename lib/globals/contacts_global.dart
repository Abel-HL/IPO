import 'dart:math';

class ContactsInfo {
  static final ContactsInfo _instance = ContactsInfo._internal();

  factory ContactsInfo() {
    return _instance;
  }

  ContactsInfo._internal();

  List<String> randomNames = List.generate(10, (index) => generateRandomName());
  List<String> randomPhoneNumbers = List.generate(10, (index) => generateRandomPhoneNumber());
}




String generateRandomName() {
  List<String> names = [
    'John',
    'Jane',
    'Michael',
    'Emily',
    'David',
    'Sarah',
    'Daniel',
    'Olivia',
  ];

  Random random = Random();
  int index = random.nextInt(names.length);
  return names[index];
}

String generateRandomPhoneNumber() {
  Random random = Random();
  String phoneNumber = '+';
  for (int i = 0; i < 11; i++) {
    if (i == 2 || i == 5 || i == 7 || i==9) {
      phoneNumber += ' ';
    }
    int digit = random.nextInt(10);
    phoneNumber += digit.toString();
  }
  return phoneNumber;
}