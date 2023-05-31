import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as view;

String? response = "nulll";
Future<String?> value() async {
  // if (response!.isEmpty) {
  //   return "";
  // }
  // response
  // if (response!.isNotEmpty) {
    return response;
  // }
}

// /*  */
class WebView extends StatelessWidget {
  final String url;

  // const WebView(Key? key) : super(key: key);

  const WebView({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    view.WebViewController? controller;

    controller = view.WebViewController()
      ..setJavaScriptMode(view.JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        view.NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            controller!.runJavaScriptReturningResult(
                "document.getElementById('return').innerText")
                .then((value) async {
              // if (value == "null ") {
              //   response =
              //       "{\"status\":\"requery\",\"message\":\"Reaffirm Transaction Status on Server\"}";
              // } else {
              response = response!.length > 7 ? response : value.toString();
              // }
            });
          },
          onWebResourceError: (view.WebResourceError error) {},
          onNavigationRequest: (view.NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return view.NavigationDecision.prevent;
            }
            return view.NavigationDecision.navigate;
          },

        ),

      )
      ..loadRequest(Uri.parse(url));

// value contains the html data of page as string

    // );
    // WebView(    )
    // return view.WebView(
    //   initialUrl: url,
    //   onWebViewCreated: (controller) {
    //     _controller = controller;
    //   },
    //   javascriptMode: view.JavaScriptMode.unrestricted,
    //   gestureNavigationEnabled: true,
    //   onPageFinished: (_) {
    //     readResponse();
    //   },
    // );
    return view.WebViewWidget(controller: controller);
  }
}
