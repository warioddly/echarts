import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';

class BarChartWithNegativeValues extends StatelessWidget {
  const BarChartWithNegativeValues({super.key});

  @override
  Widget build(BuildContext context) {

    const labelRight = {
      'position': 'right'
    };

    return GraphifyView(
      controller: GraphifyController(),
      initialOptions: const {
        "title": {
          "text": "Bar Chart with Negative Value"
        },
        "tooltip": {
          "trigger": "axis",
          "axisPointer": {
            "type": "shadow"
          }
        },
        "grid": {
          "top": 80,
          "bottom": 30
        },
        "xAxis": {
          "type": "value",
          "position": "top",
          "splitLine": {
            "lineStyle": {
              "type": "dashed"
            }
          }
        },
        "yAxis": {
          "type": "category",
          "axisLine": {
            "show": false
          },
          "axisLabel": {
            "show": false
          },
          "axisTick": {
            "show": false
          },
          "splitLine": {
            "show": false
          },
          "data": [
            "ten",
            "nine",
            "eight",
            "seven",
            "six",
            "five",
            "four",
            "three",
            "two",
            "one"
          ]
        },
        "series": [
          {
            "name": 'Cost',
            'type': 'bar',
            'stack': 'Total',
            'label': {
              'show': true,
              'formatter': '{b}'
            },
            'data': [
              { 'value': -0.07, 'label': labelRight },
              { 'value': -0.09, 'label': labelRight },
              0.2,
              0.44,
              { 'value': -0.23, 'label': labelRight },
              0.08,
              { 'value': -0.17, 'label': labelRight },
              0.47,
              { 'value': -0.36, 'label': labelRight },
              0.18
            ]
          }
        ]
      },
    );
  }
}
