import 'package:flutter/material.dart';
import 'package:flutter_auth/components/common_widget.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/model/response/post_model.dart';
import 'package:flutter_auth/provider/auth_provider.dart';
import 'package:flutter_auth/screens/Home/PostView.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CommonWidgets {
  bool _isLoading = true;
  String _txtSearch;
  List<PostModel> posts = [];

  @override
  void initState() {
    _post();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading ? _vwIndicator() : _vwContent(),
    );
  }

  _vwIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _vwContent() {
    return Column(
      children: [
        RoundedInputField(
          hintText: 'Search',
          icon: Icons.search,
          onChanged: (value) {
            setState(() {
              _txtSearch = value;
            });
          },
        ),
        Expanded(
          child: _vwList(),
        )
      ],
    );
  }

  _vwList() {
    final filteredPost = (_txtSearch?.isEmpty ?? true)
        ? posts
        : posts.where(
            (element) {
              return (element.body.contains(_txtSearch) &&
                  element.title.contains(_txtSearch));
            },
          ).toList();
    return ListView.builder(
        itemCount: filteredPost.length,
        itemBuilder: (context, index) {
          return PostView(
            post: filteredPost[index],
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
