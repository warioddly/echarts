import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';
import 'package:graphify_example/utils/helpers.dart';

class LargeAreaChart extends StatefulWidget {
  const LargeAreaChart({super.key});

  @override
  State<LargeAreaChart> createState() => _LargeAreaChartState();
}

class _LargeAreaChartState extends State<LargeAreaChart> {
  final controller = GraphifyController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      controller.update({
        "series": [
          {
            "data": Helper.randomData(1200, 3200)
          }
        ]
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphifyView(
      controller: controller,
      initialOptions: {
        "tooltip": const {
          "trigger": "axis",
          "position": "function (pt) { return [pt[0], '10%']; }"
        },
        "title": const {
          "left": "center",
          "text": "Large Area Chart"
        },
        "toolbox": const {
          "feature": {
            "dataZoom": {
              "yAxisIndex": "none"
            },
            "restore": {},
            "saveAsImage": {}
          }
        },
        "xAxis": const {
          "type": "category",
          "boundaryGap": false,
        },
        "yAxis": const {
          "type": "value",
          "boundaryGap": [0, "100%"]
        },
        "dataZoom": const [
          {
            "type": "inside",
            "start": 0,
            "end": 10
          },
          {
            "start": 0,
            "end": 10
          }
        ],
        "series": [
          {
            "name": "Fake Data",
            "type": "line",
            "symbol": "none",
            "sampling": "lttb",
            "itemStyle": const {
              "color": "rgb(255, 70, 131)"
            },
            "areaStyle": const {},
            "data": Helper.randomData(1200, 3200)
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
