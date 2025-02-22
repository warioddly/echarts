import 'package:flutter/material.dart';
import 'package:graphify/graphify.dart';

class NestedPiesChart extends StatelessWidget {
  const NestedPiesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphifyView(
      controller: GraphifyController(),
      initialOptions: const {
        "tooltip": {"trigger": "item", "formatter": "{a} <br/>{b}: {c} ({d}%)"},
        "legend": {
          "data": [
            "Direct",
            "Marketing",
            "Search Engine",
            "Email",
            "Union Ads",
            "Video Ads",
            "Baidu",
            "Google",
            "Bing",
            "Others"
          ]
        },
        "series": [
          {
            "name": "Access From",
            "type": "pie",
            "selectedMode": "single",
            "radius": [0, "30%"],
            "label": {"position": "inner", "fontSize": 14},
            "labelLine": {"show": false},
            "data": [
              {"value": 1548, "name": "Search Engine"},
              {"value": 775, "name": "Direct"},
              {"value": 679, "name": "Marketing", "selected": true}
            ]
          },
          {
            "name": "Access From",
            "type": 'pie',
            'radius': ['45%', '60%'],
            'labelLine': {'length': 30},
            'label': {
              'formatter': '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
              'backgroundColor': '#F6F8FC',
              'borderColor': '#8C8D8E',
              'borderWidth': 1,
              'borderRadius': 4,
              'rich': {
                'a': {'color': '#6E7079', 'lineHeight': 22, 'align': 'center'},
                'hr': {
                  'borderColor': '#8C8D8E',
                  'width': '100%',
                  'borderWidth': 1,
                  'height': 0
                },
                'b': {
                  'color': '#4C5058',
                  'fontSize': 14,
                  'fontWeight': 'bold',
                  'lineHeight': 33
                },
                'per': {
                  'color': '#fff',
                  'backgroundColor': '#4C5058',
                  'padding': [3, 4],
                  'borderRadius': 4
                }
              }
            },
            'data': [
              {'value': 1048, 'name': 'Baidu'},
              {'value': 335, 'name': 'Direct'},
              {'value': 310, 'name': 'Email'},
              {'value': 251, 'name': 'Google'},
              {'value': 234, 'name': 'Union Ads'},
              {'value': 147, 'name': 'Bing'},
              {'value': 135, 'name': 'Video Ads'},
              {'value': 102, 'name': 'Others'}
            ]
          }
        ]
      },
    );
  }
}
