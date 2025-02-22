# GRAPHIFY
> #### A data visualization charts library, based on Apache ECharts, able to build advanced charts like WebGL 3D, GIS map, etc.
> #### [See demo](https://warioddly.github.io/graphify/).
> #### [See Echarts Examples](https://echarts.apache.org/examples/en/index.html)

| ![graph_webkit_dep](https://github.com/user-attachments/assets/2ce1808d-a542-4295-9e3a-4918bcf6053e)    | ![bar_3d_chart](https://github.com/user-attachments/assets/6d50d560-ee8e-4f39-99c4-dc271ba2556c) |
|:--------------------------------------------------------------------:|:--------------------------------------------------------------------:|
| ![candle_stick_brush](https://github.com/user-attachments/assets/668c6fef-4068-48d8-9a49-fe00c47ef946) | ![all](https://github.com/user-attachments/assets/2403f837-8870-4eba-a75c-30d41e7e543f) |

A Flutter package that serves as a bridge to [Apache ECharts](https://echarts.apache.org/) for creating interactive charts and data visualizations in your Flutter applications.


## Features

- **Apache ECharts Integration:** Leverage the full power of Apache ECharts directly within your Flutter app.
- **Flexible Configuration:** Pass chart configurations as JSON to render interactive visualizations.
- **All ECharts Features:** You can find [here](https://echarts.apache.org/en/feature.html) eCharts features


## Installation

Add the dependency to your `pubspec.yaml` with:
```bash
dart pub add graphify
```

Then run:
```bash
flutter pub get
```



## Quick Start
### Importing the Package
Import the package into your Dart file:

```dart
import 'package:graphify/graphify.dart';
```
### Basic Example
Below is a minimal example demonstrating how to display a bar chart:
```dart
class BasicBarChart extends StatefulWidget {
  const BasicBarChart({super.key});

  @override
  State<BasicBarChart> createState() => _BasicBarChartState();
}

class _BasicBarChartState extends State<BasicBarChart> {

  final controller = GraphifyController();

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
            "data": [120, 200, 150, 80, 70, 110, 130],
            "type": "bar"
          }
        ]
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
```

## Parameters and Settings
A string containing the [JSON configuration](https://echarts.apache.org/en/option.html#title) for the chart, based on the Apache ECharts documentation.

## Documentation and Support
Refer to the Apache ECharts Documentation for detailed configuration options and features.
For source code, issue tracking, and contributions, visit the GitHub repository.

## License
This project is licensed under the [MIT License](https://github.com/warioddly/graphify/blob/main/LICENSE).

## Contributing
We welcome your contributions!

1. Fork the repository and create a branch for your changes.
2. Commit your changes with clear messages.
3. Open a pull request describing your work.

For bug reports or feature requests, please open an issue.

Thank you!
