import 'package:flutter/material.dart';
import 'package:flutter_auth/components/common_widget.dart';
import 'package:flutter_auth/model/response/post_model.dart';
import 'package:flutter_auth/provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CommonWidgets {
  bool _isLoading = true;
  List<PostModel> posts = [];

  @override
  void initState() {
    _post();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _isLoading ? _vwIndicator() : _vwList());
  }

  _vwIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _vwList() {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
              color: Colors.green,
              child: Text(posts[index].body),
            ),
          );
        });
  }

  _post() {
    setState(() => _isLoading = true);
    Network().posts().then((value) {
      setState(() {
        posts = value.posts;
      });
    }).catchError((error) {
      showAlert(context, body: error, title: 'Response Error');
    }).whenComplete(() {
      setState(() => _isLoading = false);
    });
  }
}
