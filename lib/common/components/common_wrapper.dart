import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/views/no_internet_screen.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CommonWrapper extends StatelessWidget {
  var child;
  CommonWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected ? child : NoInternetScreen();
          },
          child: child,
        ),
      ),
    );
  }
}
