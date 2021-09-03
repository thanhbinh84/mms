import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mms/data/models/issue_list.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IssueDetailsScreen extends StatefulWidget {
  final Issue issue;

  IssueDetailsScreen({required this.issue, Key? key}) : super(key: key);

  @override
  _IssueDetailsScreenState createState() => _IssueDetailsScreenState();
}

class _IssueDetailsScreenState extends State<IssueDetailsScreen> {
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
          appBar: AppBar(title: Text('Issue Details')),
          body: WebView(
            initialUrl: widget.issue.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
            gestureNavigationEnabled: true,
          ),
        ),
        inAsyncCall: _isLoading,
        progressIndicator: SpinKitDoubleBounce(
          color: Colors.white.withOpacity(0.8),
        ));
  }
}
