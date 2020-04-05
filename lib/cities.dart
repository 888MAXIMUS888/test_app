import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/city_bloc.dart';
import 'data/city_model.dart';

class Cities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => context.bloc<CityBloc>().add(GetCity()),
          ),
          Container(child: BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return cityState(context, state);
              // return ListView.builder(
              //   itemBuilder: (BuildContext context, int index) {
              //     return ListTile();
              //   },
              // );
            },
          )),
        ],
      ),
    ));
  }

  cityState(BuildContext context, CityState state) {
    if (state is CityInitial) {
      return buildList(context, state.city);
    } else if (state is CityLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is CityLoaded) {
      return buildList(context, state.city);
    } else if (state is CityError) {
      print("ERROR");
    }
  }

  buildList(BuildContext context, City city) {
    return Expanded(
        child: ListView.builder(
      itemCount: city.cityName.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(city.cityName[index]),
        );
      },
    ));
  }
}
