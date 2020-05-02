import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/_viewmodel_builder.dart';

import 'home_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                model.updateTitle();
              },
              child: Icon(Icons.search),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(100),
                child: model.isBusy
                    ? CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            TextFormField(
                                controller: model.googleTextController,
                                validator: (v) {
                                  return v;
                                }),
                            MaterialButton(
                              onPressed: () => model.searchResult(),
                              color: Colors.teal,
                              child: Text('SEARCH',
                                  style: TextStyle(color: Colors.white70)),
                            ),
                          ]),
              ),
            ),
          );
        });
  }
}
