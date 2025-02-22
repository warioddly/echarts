
import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'dart:math';

class _Grad {
  final double x;
  final double y;
  final double z;

  _Grad(this.x, this.y, this.z);

  double dot2(double x, double y) => this.x * x + this.y * y;
  double dot3(double x, double y, double z) => this.x * x + this.y * y + this.z * z;
}

class _NoiseHelper {
  final List<_Grad> grad3 = [
    _Grad(1, 1, 0),
    _Grad(-1, 1, 0),
    _Grad(1, -1, 0),
    _Grad(-1, -1, 0),
    _Grad(1, 0, 1),
    _Grad(-1, 0, 1),
    _Grad(1, 0, -1),
    _Grad(-1, 0, -1),
    _Grad(0, 1, 1),
    _Grad(0, -1, 1),
    _Grad(0, 1, -1),
    _Grad(0, -1, -1),
  ];

  final List<int> p = [
    151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140,
    36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247, 120,
    234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33,
    88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71,
    134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133,
    230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65, 25, 63, 161,
    1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 135, 130,
    116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250,
    124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227,
    47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2, 44,
    154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129, 22, 39, 253, 19, 98,
    108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 251, 34,
    242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14,
    239, 107, 49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121,
    50, 45, 127, 4, 150, 254, 138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243,
    141, 128, 195, 78, 66, 215, 61, 156, 180
  ];

  List<int> perm = List.filled(512, 0);
  List<_Grad> gradP = List.filled(512, _Grad(0, 0, 0));

  _NoiseHelper() {
    // Инициализируем таблицы с начальным seed = 0.
    seed(0);
  }

  /// Функция для установки seed.
  void seed(dynamic seedVal) {
    double s;
    if (seedVal is double) {
      s = seedVal;
    } else if (seedVal is int) {
      s = seedVal.toDouble();
    } else {
      throw Exception("Invalid seed type");
    }

    if (s > 0 && s < 1) {
      s *= 65536;
    }
    int intSeed = s.floor();
    if (intSeed < 256) {
      intSeed |= intSeed << 8;
    }
    for (int i = 0; i < 256; i++) {
      int v;
      if ((i & 1) == 1) {
        v = p[i] ^ (intSeed & 255);
      } else {
        v = p[i] ^ ((intSeed >> 8) & 255);
      }
      perm[i] = v;
      perm[i + 256] = v;
      gradP[i] = grad3[v % 12];
      gradP[i + 256] = gradP[i];
    }
  }

  double fade(double t) {
    return t * t * t * (t * (t * 6 - 15) + 10);
  }

  double lerp(double a, double b, double t) {
    return (1 - t) * a + t * b;
  }

  /// 2D Perlin Noise
  double perlin2(double x, double y) {
    int X = x.floor();
    int Y = y.floor();
    x = x - X;
    y = y - Y;
    X = X & 255;
    Y = Y & 255;
    double n00 = gradP[X + perm[Y]].dot2(x, y);
    double n01 = gradP[X + perm[Y + 1]].dot2(x, y - 1);
    double n10 = gradP[X + 1 + perm[Y]].dot2(x - 1, y);
    double n11 = gradP[X + 1 + perm[Y + 1]].dot2(x - 1, y - 1);
    double u = fade(x);
    double v = fade(y);
    return lerp(lerp(n00, n10, u), lerp(n01, n11, u), v);
  }
}

class HeatmapDiscreteMappingOfColor extends StatefulWidget {
  const HeatmapDiscreteMappingOfColor({super.key});

  @override
  State<HeatmapDiscreteMappingOfColor> createState() => _HeatmapDiscreteMappingOfColorState();
}

class _HeatmapDiscreteMappingOfColorState extends State<HeatmapDiscreteMappingOfColor> {
  @override
  Widget build(BuildContext context) {

    final noise = _NoiseHelper();
    noise.seed(Random().nextDouble());

    List<int> xData = [];
    List<int> yData = [];

    List<List<double>> generateData(double theta, double min, double max) {
      List<List<double>> data = [];
      for (int i = 0; i <= 200; i++) {
        for (int j = 0; j <= 100; j++) {
          // Вычисляем значение шума и сдвигаем его на 0.5
          double value = noise.perlin2(i / 40.0, j / 20.0) + 0.5;
          data.add([i.toDouble(), j.toDouble(), value]);
        }
        xData.add(i);
      }
      for (int j = 0; j < 100; j++) {
        yData.add(j);
      }
      return data;
    }

    List<List<double>> data = generateData(2, -5, 5);

    final option = {
      'tooltip': {},
      'grid': {
        'right': 140,
        'left': 40,
      },
      'xAxis': {
        'type': 'category',
        'data': xData,
      },
      'yAxis': {
        'type': 'category',
        'data': yData,
      },
      'visualMap': {
        'type': 'piecewise',
        'min': 0,
        'max': 1,
        'left': 'right',
        'top': 'center',
        'calculable': true,
        'realtime': false,
        'splitNumber': 8,
        'inRange': {
          'color': [
            '#313695',
            '#4575b4',
            '#74add1',
            '#abd9e9',
            '#e0f3f8',
            '#ffffbf',
            '#fee090',
            '#fdae61',
            '#f46d43',
            '#d73027',
            '#a50026',
          ],
        },
      },
      'series': [
        {
          'name': 'Gaussian',
          'type': 'heatmap',
          'data': data,
          'emphasis': {
            'itemStyle': {
              'borderColor': '#333',
              'borderWidth': 1,
            },
          },
          'progressive': 1000,
          'animation': false,
        },
      ],
    };

    return GraphifyView(
      controller: GraphifyController(),
      initialOptions: option
    );
  }
}
