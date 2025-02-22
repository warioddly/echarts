import 'dart:math';

class Utils {
  static String uid() {
    var random = Random();

    var chars = 'abcdefghijklmnopqrstuvwxyz';
    var uid = '';

    for (var i = 0; i < 10; i++) {
      uid += chars[random.nextInt(chars.length)];
    }

    return uid;
  }
}
