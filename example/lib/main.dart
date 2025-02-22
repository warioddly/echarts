import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show showCupertinoSheet;
import 'package:graphify_example/charts/bar_3d_chart.dart';
import 'package:graphify_example/charts/bar_chart_with_negative_values.dart';
import 'package:graphify_example/charts/basic_area_chart.dart';
import 'package:graphify_example/charts/basic_bar_chart.dart';
import 'package:graphify_example/charts/basic_line_chart.dart';
import 'package:graphify_example/charts/candle_stick_brush.dart';
import 'package:graphify_example/charts/customized_radar_chart.dart';
import 'package:graphify_example/charts/graph_webkit_dep.dart';
import 'package:graphify_example/charts/heatmap_discrete_mapping_of_color.dart';
import 'package:graphify_example/charts/large_area_chart.dart';
import 'package:graphify_example/charts/nested_pies_chart.dart';
import 'package:graphify_example/charts/nightingale_chart.dart';
import 'package:graphify_example/charts/pie_chart.dart';
import 'package:graphify_example/charts/proportion_of_browsers.dart';
import 'package:graphify_example/charts/radial_polar_bar_chart.dart';
import 'package:graphify_example/charts/shang_hai_index.dart';
import 'package:graphify_example/charts/stacked_area_chart.dart';
import 'package:graphify_example/charts/tangential_polar_bar_chart.dart';
import 'package:graphify_example/charts/world_population.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const charts = {
    "Basic Line Chart": BasicLineChart(),
    'Basic Area Chart': BasicAreaChart(),
    'Stacked Area Chart': StackedAreaChart(),
    'Large Area Chart': LargeAreaChart(),
    'Basic Bar Chart': BasicBarChart(),
    'Bar Chart With Negative Values': BarChartWithNegativeValues(),
    'Radial Polar Bar Chart': RadialPolarBarChart(),
    'Tangential Polar Bar Label Position (middle)': TangentialPolarBarChart(),
    'World Population': WorldPopulation(),
    'Pie Chart': PieChart(),
    'Nightingale Chart': NightingaleChart(),
    'Nested Pies Chart': NestedPiesChart(),
    'Shanghai Index': ShangHaiIndex(),
    'Candle Stick Brush': CandleStickBrush(),
    'Proportion Of Browsers': ProportionOfBrowsers(),
    'Customized Radar Chart': CustomizedRadarChart(),
    'Heatmap Discrete Mapping Of Color': HeatmapDiscreteMappingOfColor(),
    'Graph Webkit Dep': GraphWebkitDep(),
    'Bar 3D Chart': Bar3dChart(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graphify Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Graphify Examples",
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  for (final entry in charts.entries)
                    ListTile(
                      title: Text(entry.key),
                      onTap: () => _showChart(context, entry.key, entry.value),
                    ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  void _showChart(BuildContext context, String title, Widget chart) {

    final size = MediaQuery.of(context).size;

    showCupertinoSheet(
      context: context,
      pageBuilder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(
                height: size.height * (size.width > 600 ? 0.7 : 0.5),
                width: size.width > 600 ? size.width : size.width,
              ),
              child: chart,
            ),
          ),
        );
      },
    );
  }

}

