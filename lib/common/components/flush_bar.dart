import "package:flutter/material.dart";
import 'package:flushbar/flushbar.dart';

notifySuccess(
  context, {
  title = "Success!",
  message: "The action was completed successfully.",
}) {
  Flushbar(
    title: title,
    icon: Icon(
      Icons.done,
      color: Colors.white,
      size: 26,
    ),
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    barBlur: 2,
    backgroundColor: Color.fromRGBO(46, 159, 84, 0.9),
    message: message,
    duration: Duration(seconds: 3),
  )..show(context);
}

notifyError(
  context, {
  title = "Error!",
  message: "Something went wrong!",
}) {
  Flushbar(
    icon: Icon(
      Icons.error_outline,
      color: Colors.white,
      size: 26,
    ),
    title: title,
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    barBlur: 2,
    backgroundColor: Color.fromRGBO(247, 54, 54, 0.9),
    message: message,
    duration: Duration(seconds: 3),
  )..show(context);
}

notifyInfo(
  context, {
  title = "Info!",
  message: "Something doesn't seem right!",
}) {
  Flushbar(
    title: title,
    icon: Icon(
      Icons.info_outline,
      color: Colors.white,
      size: 26,
    ),
    flushbarPosition: FlushbarPosition.TOP,
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    barBlur: 2,
    backgroundColor: Color.fromRGBO(28, 28, 28, 0.9),
    message: message,
    duration: Duration(seconds: 3),
  )..show(context);
}
