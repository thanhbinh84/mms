import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final Issue issue;

  WebViewScreen({required this.issue, Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        child: Scaffold(
          appBar: AppBar(title: Text('Issue Details On GitHub')),
          body: WebView(
            initialUrl: widget.issue.url,
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            onPageFinished: (String url) {
              if (_isLoading)
                setState(() {
                  _isLoading = false;
                });
            },
          ),
        ),
        inAsyncCall: _isLoading,
        progressIndicator: SpinKitDoubleBounce(
          color: Colors.white.withOpacity(0.8),
        ));
  }
}
