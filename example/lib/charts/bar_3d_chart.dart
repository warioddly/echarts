import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class Bar3dChart extends StatefulWidget {
  const Bar3dChart({super.key});

  @override
  State<Bar3dChart> createState() => _Bar3dChartState();
}

class _Bar3dChartState extends State<Bar3dChart> {

  final controller = GraphifyController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      controller.update({
        "series": [
          {
            "data": Helper.randomData(10, 10).map((e) => [e, e, e]).toList(),
          }
        ]
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return GraphifyView(
      controller: controller,
      initialOptions: const {
        "visualMap": {
          "show": false,
          "min": 2,
          "max": 6,
          "inRange": {
            "color": [
              "#313695",
              "#4575b4",
              "#74add1",
              "#abd9e9",
              "#e0f3f8",
              "#ffffbf",
              "#fee090",
              "#fdae61",
              "#f46d43",
              "#d73027",
              "#a50026"
            ]
          }
        },
        "xAxis3D": {
          "type": "value"
        },
        "yAxis3D": {
          "type": "value"
        },
        "zAxis3D": {
          "type": "value",
          "max": 10,
          "min": 0
        },
        "grid3D": {
          "axisLine": {
            "lineStyle": {
              "color": "#fff"
            }
          },
          "axisPointer": {
            "lineStyle": {
              "color": "#fff"
            }
          },
          "viewControl": {},
          "light": {
            "main": {
              "shadow": true,
              "quality": "ultra",
              "intensity": 1.5
            }
          }
        },
        "series": [
          {
            "type": "bar3D",
            "data": [
              [1, 1, 1],
              [2, 2, 2],
              [3, 3, 3],
              [4, 4, 4],
              [5, 5, 5],
              [6, 6, 6],
              [7, 7, 7],
              [8, 8, 8],
              [9, 9, 9],
              [10, 10, 10]
            ],
            "shading": "lambert"
          }
        ]
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

}
