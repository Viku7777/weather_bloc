import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/configure/data.dart';
import 'package:weather_app/screen/component/background_component.dart';
import 'package:weather_app/screen/view/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/view/home/bloc/home_event.dart';

class ChangeLocationView extends StatelessWidget {
  static String routes = "change_location";
  const ChangeLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Location"),
      ),
      body: Stack(
        children: [
          ...backgroundFilterView,
          ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
            itemCount: changeLocationData.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    context.read<TempBloc>().add(ChangeTempWithLatLng(
                        lat: changeLocationData[index].lat,
                        lng: changeLocationData[index].lng));
                  },
                  title: Text(changeLocationData[index].name),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
