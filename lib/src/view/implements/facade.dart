import 'package:flutter/cupertino.dart';
import 'package:graphify/src/controller/interface.dart';
import 'package:graphify/src/view/interface.dart' as view;

class GraphifyView extends StatelessWidget implements view.GraphifyView {
  const GraphifyView({
    super.key,
    this.controller,
    this.initialOptions,
  });

  @override
  final GraphifyController? controller;

  @override
  final Map<String, dynamic>? initialOptions;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
