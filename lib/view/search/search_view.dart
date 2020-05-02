import 'package:flutter/material.dart';
import 'package:stacked/_viewmodel_builder.dart';

import 'seach_model.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ViewModelBuilder<SearchViewModel>.reactive(
        viewModelBuilder: () => SearchViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.search),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: model.isBusy
                    ? CircularProgressIndicator()
                    : ListView(
                        children:
                            model.googleSearchResponse.items.map<Widget>((e) {
                          return Card(
                            elevation: 6,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.clip,textAlign: TextAlign.left,),
                                Padding(padding: EdgeInsets.only(top: 4,bottom: 8),child:Text(e.snippet,style:TextStyle(fontWeight: FontWeight.w600))),
                                Text(e.link,style: TextStyle(color: Colors.blueAccent),maxLines: 1,overflow: TextOverflow.clip,textAlign: TextAlign.left,),
                              ],
                            ),
                          ),);
                        }).toList(),
                      ),
              ),
            ),
          );
        });
  }
}
