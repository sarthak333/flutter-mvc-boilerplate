import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/controllers/home.controller.dart';
import 'package:flutter_boilerplate/view_models/home.model.dart';
import 'package:momentum/momentum.dart';

// Views files with .view suffix denote that they have a controller and a model associated to them.
// The controller and the model will have similar names.
// For example: home.view.dart should have associated home.controller.dart and home.model.dart.

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Momentum Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MomentumBuilder(
              controllers: [CounterController],
              builder: (context, snapshot) {
                var counter = snapshot<CounterModel>();
                return Column(
                  children: [
                    Text(
                      '${counter.value}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      // we don't need to rebuild the increment button, we can skip the MomentumBuilder
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                onPressed:
                    Momentum.controller<CounterController>(context).increment,
                child: Icon(Icons.exposure_plus_1),
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed:
                    Momentum.controller<CounterController>(context).decrement,
                child: Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () => Momentum.controller<CounterController>(context)
                    .displayMessage(context),
                child: Icon(Icons.notifications),
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () => Momentum.controller<CounterController>(context)
                    .goToCommonUI(context),
                child: Icon(Icons.navigate_next),
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () =>
                    Momentum.controller<CounterController>(context).checkJson(),
                child: Icon(Icons.check),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
