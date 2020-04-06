import 'package:flutter/material.dart';
import 'package:test_app/bloc/city_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class Detail extends StatelessWidget {
  final CityBloc cityBloc;
  final String city;

  Detail({this.cityBloc, this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: <Widget>[
          Text(
            city,
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
              child: StreamBuilder(
            stream: cityBloc.getCity(city),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  width: 200,
                                  child: Center(
                                      child: Text(snapshot
                                          .data.documents[index]["Places"]
                                          .toString()))),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                                child: IconButton(
                                  icon: Image.asset(
                                    "assets/up.png",
                                    color: Colors.yellow,
                                  ),
                                  onPressed: () {
                                    cityBloc.updateData(
                                        snapshot
                                            .data.documents[index].documentID,
                                        city);
                                  },
                                ),
                              ),
                              IconButton(
                                icon: Image.asset("assets/down.png"),
                                onPressed: () {
                                  cityBloc.updateData(
                                      snapshot.data.documents[index].documentID,
                                      city);
                                },
                              ),
                            ],
                          ),
                          Container(
                              child: Text(timeago.format(
                                  DateTime.fromMillisecondsSinceEpoch(int.parse(
                                      snapshot.data.documents[index]
                                          ["timestamp"]))))),
                          SizedBox(height: 30)
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ))
        ]));
  }
}
