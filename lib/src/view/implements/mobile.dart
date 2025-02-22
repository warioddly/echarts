import 'package:flutter/material.dart';
import 'package:graphify/src/controller/implements/mobile.dart';
import 'package:graphify/src/resources/index.html.dart';
import 'package:graphify/src/utils/utils.dart';
import 'package:graphify/src/view/interface.dart' as view_interface;
import 'package:webview_flutter/webview_flutter.dart';

class GraphifyView extends StatefulWidget
    implements view_interface.GraphifyView {
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
  State<StatefulWidget> createState() => _GraphifyViewMobile();
}

class _GraphifyViewMobile
    extends view_interface.GraphifyViewState<GraphifyView> {
  late WebViewController webViewController;
  late var controller = widget.controller ?? GraphifyController();

  @override
  void initView() {
    controller.identifier = Utils.uid();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadHtmlString(
          indexHtml(id: controller.identifier, enableDependency: true))
      ..setOnConsoleMessage((message) {
        debugPrint("[+] onConsoleMessage ${message.message}");
      });

    controller.connector = webViewController;

    Future.delayed(
        Duration.zero, () => controller.update(widget.initialOptions));
  }

  @override
  Widget buildView() {
    viewInitialized = true;
    return view = WebViewWidget(controller: webViewController);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
