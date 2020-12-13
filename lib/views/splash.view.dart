import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/controllers/app_boot.controller.dart';
import 'package:flutter_boilerplate/view_models/app_boot.model.dart';
import 'package:momentum/momentum.dart';

// Views files with .view suffix denote that they have a controller and a model associated to them.
// The controller and the model will have similar names.
// For example: splash.view.dart should have associated splash.controller.dart and splash.model.dart.

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Splash Screen"),
            MomentumBuilder(
              controllers: [AppBootController],
              builder: (context, snapshot) {
                var counter = snapshot<AppBootModel>();
                return Column(
                  children: [
                    Text(
                      '${counter.token}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                );
              },
            ),
            RaisedButton(
              onPressed:
                  Momentum.controller<AppBootController>(context).updateToken,
              child: Text("Update token"),
            ),
            RaisedButton(
              onPressed: () => Momentum.controller<AppBootController>(context)
                  .goToCounter(context),
              child: Text("Go to counter"),
            ),
          ],
        ),
      ),
    );
  }
}
