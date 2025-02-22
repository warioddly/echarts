
import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';

class ProportionOfBrowsers extends StatelessWidget {
  const ProportionOfBrowsers({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphifyView(
      controller: GraphifyController(),
      initialOptions: {
        'title': const {
          'text': 'Proportion of Browsers',
          'subtext': 'Fake Data',
          'top': 10,
          'left': 10,
        },
        'tooltip': const {
          'trigger': 'item',
        },
        'legend': {
          'type': 'scroll',
          'bottom': 10,
          'data': List.generate(28, (index) => (index + 1 + 2000).toString()),
        },
        'visualMap': const {
          'top': 'middle',
          'right': 10,
          'color': ['red', 'yellow'],
          'calculable': true,
        },
        'radar': const {
          'indicator': [
            {'text': 'IE8-', 'max': 400},
            {'text': 'IE9+', 'max': 400},
            {'text': 'Safari', 'max': 400},
            {'text': 'Firefox', 'max': 400},
            {'text': 'Chrome', 'max': 400},
          ],
        },
        'series': List.generate(28, (index) {
          int i = index + 1;
          return {
            'type': 'radar',
            'symbol': 'none',
            'lineStyle': {
              'width': 1,
            },
            'emphasis': {
              'areaStyle': {
                'color': 'rgba(0,250,0,0.3)',
              },
            },
            'data': [
              {
                'value': [
                  (40 - i) * 10,
                  (38 - i) * 4 + 60,
                  i * 5 + 10,
                  i * 9,
                  (i * i) / 2,
                ],
                'name': (i + 2000).toString(),
              }
            ],
          };
        }),
      },
    );
  }
}
