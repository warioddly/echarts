import 'package:graphify/src/resources/lib/echarts.gl.min.dart';
import 'package:graphify/src/resources/lib/echarts.min.dart';
import 'package:graphify/src/resources/lib/jquery.min.dart';
import 'package:graphify/src/utils/js_methods.dart';

const dependencies = "$jQuery "
    "$echartsMin "
    "$echartsGlMin "
    "$chartScripts";

const String chartScripts = """
    
    const graphify_charts = {};
    
    function ${JsMethods.initChart}(chart_id, chart, option) {
      option = ${JsMethods.normalizeJson}(option);
      chart.setOption(option);
      graphify_charts[chart_id] = { chart, option };
    }
    
    function ${JsMethods.updateChart}(chart_id, option) {
      if (!graphify_charts[chart_id]) return;
      const chart = graphify_charts[chart_id].chart;
      option = ${JsMethods.normalizeJson}(option);
      chart.setOption(option);
      graphify_charts[chart_id].option = option;
    }
    
    function ${JsMethods.disposeChart} (chart_id) {
      const chart = graphify_charts[chart_id]?.chart;
      if (!chart) return;
      chart.dispose();
      delete graphify_charts[chart_id];
    }
    
    function ${JsMethods.normalizeJson}(option) {
      if (typeof option === 'object') return option;
      if (option instanceof String && option.length === 0 || option == null) return {};
      return JSON.parse(option);
    }
    
""";

const htmlDependencies = "<script>$dependencies</script>";
