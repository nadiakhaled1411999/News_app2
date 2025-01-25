import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
   final String url; 
  const NewsWebView({super.key, required this.url,  });
  

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late WebViewController controller;
  @override
 void initState() {
  super.initState();
  controller = WebViewController()
   ..setJavaScriptMode(JavaScriptMode.unrestricted)  
    ..loadRequest(Uri.parse(widget.url));
   
    print("Loading URL: ${widget.url}");
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "News ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "Cloud",
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
        body: WebViewWidget(controller: controller));
  }
}
