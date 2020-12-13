import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/components/common_button.dart';
import 'package:flutter_boilerplate/common/components/regular_text_input.dart';
import 'package:flutter_boilerplate/common/constants.dart';

// View files without .view suffix denote that they don't have a controller and a model.
// These are standalone views.

class CommonUI extends StatefulWidget {
  @override
  _CommonUIState createState() => _CommonUIState();
}

class _CommonUIState extends State<CommonUI> {
  var loading = false;

  @override
  Widget build(BuildContext context) {
    buttonPress() {
      setState(() {
        loading = true;
      });

      Future.delayed(const Duration(milliseconds: 3000), () {
        setState(() {
          loading = false;
        });
      });
    }

    return Container(
      padding: const EdgeInsets.all(32),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularTextInput(),
          SizedBox(height: 10),
          CommonButton(
            loading: loading,
            action: buttonPress,
            type: PRIMARY,
          ),
          SizedBox(height: 10),
          CommonButton(
            loading: loading,
            action: buttonPress,
            type: SECONDARY,
          ),
          SizedBox(height: 10),
          CommonButton(
            loading: loading,
            action: buttonPress,
            type: TERTIARY,
          ),
          SizedBox(height: 10),
          CommonButton(
            loading: loading,
            action: buttonPress,
            type: PRIMARY,
            icon: Icons.search,
          ),
          SizedBox(height: 10),
          CommonButton(
            loading: loading,
            action: buttonPress,
            type: SECONDARY,
            icon: Icons.alarm,
          ),
          SizedBox(height: 10),
          CommonButton(
            loading: loading,
            action: buttonPress,
            type: TERTIARY,
            icon: Icons.arrow_back,
          ),
        ],
      ),
    );
  }
}
