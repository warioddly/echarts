import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class EchartAware extends StatelessWidget {
  /// Child widget
  final Widget child;

  /// If set to true, a red box will appear around the widget
  final bool debug;

  /// Constructor
  const EchartAware({
    Key? key,
    required this.child,
    this.debug = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PointerInterceptor(
      key: key,
      debug: debug,
      child: child,
    );
  }
}