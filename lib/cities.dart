import 'package:flutter/material.dart';
import 'package:test_app/bloc/city_bloc.dart';
import 'package:test_app/detail.dart';

class Cities extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CitiesState();
}

class CitiesState extends State<Cities> {
  final cityBloc = CityBloc();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    cityBloc.getCityCollection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          searchWidget(),
          StreamBuilder(
            stream: cityBloc.outCityCollection,
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return listItems(snapshot);
            },
          )
        ],
      ),
    ));
  }

  searchWidget() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 40,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: TextField(
          decoration:
              InputDecoration(icon: Icon(Icons.search, color: Colors.blue)),
          controller: _controller,
          onChanged: (text) {
            cityBloc.seachCity(text);
          },
        ));
  }

  listItems(snapshot) {
    return Expanded(
        child: ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: GestureDetector(
              child: Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Center(child: Text(snapshot.data[index]))))),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detail(
                        cityBloc: cityBloc, city: snapshot.data[index])));
          },
        );
      },
    ));
  }
}
