import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class RadialPolarBarChart extends StatefulWidget {
  const RadialPolarBarChart({super.key});

  @override
  State<RadialPolarBarChart> createState() => _RadialPolarBarChartState();
}

class _RadialPolarBarChartState extends State<RadialPolarBarChart> {

  final controller = GraphifyController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      controller.update({
        "series": [
          {
            "data": Helper.randomData(4, 4),
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
        "title": [
          {
            "text": "Radial Polar Bar Label Position (middle)"
          }
        ],
        "polar": {
          "radius": [30, "80%"]
        },
        "radiusAxis": {
          "max": 4
        },
        "angleAxis": {
          "type": "category",
          "data": ["a", "b", "c", "d"],
          "startAngle": 75
        },
        "tooltip": {},
        "series": {
          "type": "bar",
          "data": [2, 1.2, 2.4, 3.6],
          "coordinateSystem": "polar",
          "label": {
            "show": true,
            "position": "middle",
            "formatter": "{b}: {c}"
          }
        },
        "animation": false
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
