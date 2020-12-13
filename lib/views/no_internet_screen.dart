import 'package:flutter/material.dart';

// View files without .view suffix denote that they don't have a controller and a model.
// These are standalone views.

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: Center(
          child: Text("No internet connection!"),
        ),
      ),
    );
  }
}
