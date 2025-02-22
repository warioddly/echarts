import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class StackedAreaChart extends StatefulWidget {
  const StackedAreaChart({super.key});

  @override
  State<StackedAreaChart> createState() => _StackedAreaChartState();
}

class _StackedAreaChartState extends State<StackedAreaChart> {
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
          },
          {
            "data": Helper.randomData(7, 300),
          },
          {
            "data": Helper.randomData(7, 300),
          },
          {
            "data": Helper.randomData(7, 300),
          },
          {
            "data": Helper.randomData(7, 300),
          },
        ]
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphifyView(
      controller: controller,
      initialOptions: const {
        "title": {"text": "Stacked Area Chart"},
        "tooltip": {
          "trigger": "axis",
          "axisPointer": {
            "type": "cross",
            "label": {"backgroundColor": "#6a7985"}
          }
        },
        "legend": {
          "data": ["Email", "Union Ads", "Video Ads", "Direct", "Search Engine"]
        },
        "toolbox": {
          "feature": {"saveAsImage": {}}
        },
        "grid": {
          "left": "3%",
          "right": "4%",
          "bottom": "3%",
          "containLabel": true
        },
        "xAxis": [
          {
            "type": "category",
            "boundaryGap": false,
            "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
          }
        ],
        "yAxis": [
          {"type": "value"}
        ],
        "series": [
          {
            "name": "Email",
            "type": 'line',
            'stack': 'Total',
            'areaStyle': {},
            'emphasis': {'focus': 'series'},
            'data': [120, 132, 101, 134, 90, 230, 210]
          },
          {
            "name": "Union Ads",
            "type": "line",
            "stack": "Total",
            "areaStyle": {},
            "emphasis": {"focus": "series"},
            "data": [220, 182, 191, 234, 290, 330, 310]
          },
          {
            "name": "Video Ads",
            "type": "line",
            "stack": "Total",
            "areaStyle": {},
            "emphasis": {"focus": "series"},
            "data": [150, 232, 201, 154, 190, 330, 410]
          },
          {
            "name": "Direct",
            "type": "line",
            "stack": "Total",
            "areaStyle": {},
            "emphasis": {"focus": "series"},
            "data": [320, 332, 301, 334, 390, 330, 320]
          },
          {
            "name": "Search Engine",
            "type": "line",
            "stack": "Total",
            "label": {"show": true, "position": "top"},
            "areaStyle": {},
            'emphasis': {'focus': 'series'},
            'data': [820, 932, 901, 934, 1290, 1330, 1320]
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
