import 'dart:math';

class Helper {

  static List<int> randomData(int length,[ int? maxValue]) {
    return List.generate(length, (index) => Random().nextInt(maxValue ?? 1000));
  }

}