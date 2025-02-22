import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class TangentialPolarBarChart extends StatefulWidget {
  const TangentialPolarBarChart({super.key});

  @override
  State<TangentialPolarBarChart> createState() => _TangentialPolarBarChartState();
}

class _TangentialPolarBarChartState extends State<TangentialPolarBarChart> {

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
            "text": "Tangential Polar Bar Label Position (middle)"
          }
        ],
        "polar": {
          "radius": [30, "80%"]
        },
        "angleAxis": {
          "max": 4,
          "startAngle": 75
        },
        "radiusAxis": {
          "type": "category",
          "data": ["a", "b", "c", "d"]
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
        }
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
