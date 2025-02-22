import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class BasicLineChart extends StatefulWidget {
  const BasicLineChart({super.key});

  @override
  State<BasicLineChart> createState() => _BasicLineChartState();
}

class _BasicLineChartState extends State<BasicLineChart> {

  final controller = GraphifyController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      controller.update({
        "series": [
          {
            "data": Helper.randomData(7, 300),
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
        "xAxis": {
          "type": "category",
          "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        },
        "yAxis": {
          "type": "value"
        },
        "series": [
          {
            "data": [150, 230, 224, 218, 135, 147, 260],
            "type": "line"
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
