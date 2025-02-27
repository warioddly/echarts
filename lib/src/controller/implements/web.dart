import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';
import 'package:graphify/src/utils/utils.dart';
import 'package:web/web.dart';

class GraphifyController implements controller_interface.GraphifyController {
  GraphifyController() {
    uid = Utils.uid();
  }

  @override
  late final String uid;

  @override
  void update(Map<String, dynamic>? options) {
    window.callMethod(
      JsMethods.updateChart.toJS,
      uid.toJS,
      jsonEncode(options ?? {}).toJS,
    );
  }

  @override
  void dispose() {
    window.callMethod(JsMethods.disposeChart.toJS, uid.toJS);
  }
}
