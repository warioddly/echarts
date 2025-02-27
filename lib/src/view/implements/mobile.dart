import 'package:flutter/material.dart';
import 'package:graphify/src/controller/implements/mobile.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/view/interface.dart' as g_view;
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyView extends StatefulWidget implements g_view.GraphifyView {
  const GraphifyView({
    super.key,
    this.controller,
    this.initialOptions,
    this.onConsoleMessage,
  });

  @override
  final GraphifyController? controller;

  @override
  final Map<String, dynamic>? initialOptions;

  @override
  final g_view.OnConsoleMessage? onConsoleMessage;

  @override
  State<StatefulWidget> createState() => _GraphifyViewMobile();
}

class _GraphifyViewMobile extends g_view.GraphifyViewState<GraphifyView> {
  late WebViewController webViewController;
  late final _controller = widget.controller ?? GraphifyController();

  @override
  void initView() {
    _controller.connector = webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(indexHtml(id: _controller.uid, enableDependency: true))
      ..setOnConsoleMessage(
        (message) => widget.onConsoleMessage?.call(message.message),
      )
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) => _controller.update(widget.initialOptions),
      ));
  }

  @override
  Widget buildView() {
    return view = WebViewWidget(controller: webViewController);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
