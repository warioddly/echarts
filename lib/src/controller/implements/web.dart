import 'dart:convert';
import 'dart:js';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:graphify/src/controller/interface.dart' as controller_interface;
import 'package:graphify/src/utils/js_methods.dart';

class GraphifyController implements controller_interface.GraphifyController {
  @override
  String identifier = "";

  @override
  Future<void> update(Map<String, dynamic>? options) async {
    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(
        JsMethods.updateChart, [identifier, jsonEncode(options ?? {})]);
  }

  @override
  Future<void> dispose() async {
    if (identifier.isEmpty) {
      debugPrint("[+] identifier is empty");
      return;
    }

    context.callMethod(JsMethods.disposeChart, [identifier]);
  }
}
