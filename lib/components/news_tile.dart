import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/components/network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, content, posturl;

  NewsTile({
    this.imgUrl,
    this.desc,
    this.title,
    this.content,
    required this.posturl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ArticleView(postUrl: posturl!, title: title.toString()),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.withOpacity(.5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5).withOpacity(.4),
                spreadRadius: .5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              displayNetworkImageWithErrorControl(
                  borderRadius: 10,
                  imageHeight: 160,
                  imageWidth: size.width,
                  imageName: imgUrl.toString(),
                  fit: BoxFit.cover),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      desc!.length > 100
                          ? '${desc.toString().substring(0, 100)}....'
                          : '$desc....',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2!,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleView extends StatefulWidget {
  final String postUrl;
  final String title;
  ArticleView({required this.postUrl, required this.title});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Details',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 2.0,
        backgroundColor: Colors.grey[300],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          onProgress: (int progress) {
            const Center(
              child: CircularProgressIndicator(),
            );
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
