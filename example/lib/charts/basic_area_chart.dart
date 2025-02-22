import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class BasicAreaChart extends StatefulWidget {
  const BasicAreaChart({super.key});

  @override
  State<BasicAreaChart> createState() => _BasicAreaChartState();
}

class _BasicAreaChartState extends State<BasicAreaChart> {

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
          "boundaryGap": false,
          "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        },
        "yAxis": {
          "type": "value"
        },
        'tooltip': {
          'trigger': 'axis',
        },
        "series": [
          {
            "data": [150, 230, 224, 218, 135, 147, 260],
            "type": "line",
            'smooth': true,
            'areaStyle': {
              'color': {
                'type': 'RadialGradient',
                'x': 0.1,
                'y': 0.6,
                'r': 1,
                'colorStops': [
                  {
                    'color': 'rgba(255, 145, 124, 0.1)',
                    'offset': 0,
                  },
                  {
                    'color': 'rgba(255, 145, 124, 0.9)',
                    'offset': 1,
                  },
                ],
              },
            },
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
