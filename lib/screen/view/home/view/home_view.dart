// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/screen/view/home/bloc/home_state.dart';
import 'package:weather_app/screen/view/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/view/home/bloc/home_event.dart';
import 'package:weather_app/helper/app_functions.dart';
import 'package:weather_app/helper/colors.dart';
import 'package:weather_app/helper/textstyle.dart';
import 'package:weather_app/repository/repository.dart';
import 'package:weather_app/screen/component/background_component.dart';
import 'package:weather_app/screen/view/home/view/change_location_view.dart';

class WeatherHomeView extends StatefulWidget {
  static String route = "/home_view";
  const WeatherHomeView({super.key});

  @override
  State<WeatherHomeView> createState() => _WeatherHomeViewState();
}

class _WeatherHomeViewState extends State<WeatherHomeView> {
  @override
  void initState() {
    context.read<TempBloc>().add(FatchTempEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // popup menu button
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 1) {
                AppFunctions.nextScreen(ChangeLocationView.routes, context);
              } else {
                _signupWidget(context);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    const Icon(Icons.change_circle, color: Colors.black),
                    10.widthBox,
                    Text(
                      "Change Location",
                      style: AppTextStyle.s14Med.copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
              // popupmenu item 2
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: Colors.black),
                    10.widthBox,
                    Text(
                      "Logout",
                      style: AppTextStyle.s14Med.copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
            color: Colors.white,
            elevation: 2,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 1.2 * kToolbarHeight, 25, 20),
        child: Stack(
          children: [
            ...backgroundFilterView,
            BlocBuilder<TempBloc, TempAppState>(
              builder: (context, state) {
                if (state is TempSuccessState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<TempBloc>().add(FatchTempEvent());
                    },
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Text("📍 ${state.weather.areaName}",
                            style: AppTextStyle.s14reg),
                        Text("Good Morning",
                            style: AppTextStyle.s20Bold.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        Center(
                          child: getWeatherIcon(
                              state.weather.weatherConditionCode!),
                        ),
                        10.heightBox,
                        Center(
                          child: Text(
                            "${state.weather.temperature!.celsius!.round()}°C",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 55),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.weather.weatherMain!.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        ),
                        5.heightBox,
                        Center(
                          child: Text(
                              DateFormat("EEEE dd. ")
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: AppTextStyle.s16reg),
                        ),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/11.png",
                                  scale: 8,
                                ),
                                5.widthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sunrise",
                                      style: AppTextStyle.s13reg,
                                    ),
                                    3.heightBox,
                                    Text(
                                      DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunrise!),
                                      style: AppTextStyle.s13Bold,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/12.png",
                                  scale: 8,
                                ),
                                5.widthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sunset",
                                      style: AppTextStyle.s13reg,
                                    ),
                                    3.heightBox,
                                    Text(
                                      DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      style: AppTextStyle.s13Bold,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/13.png",
                                  scale: 8,
                                ),
                                5.widthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Temp Max",
                                      style: AppTextStyle.s13reg,
                                    ),
                                    3.heightBox,
                                    Text(
                                      "${state.weather.tempMax!.celsius!.round()}°C",
                                      style: AppTextStyle.s13Bold,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/14.png",
                                  scale: 8,
                                ),
                                5.widthBox,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Temp Min",
                                      style: AppTextStyle.s13reg,
                                    ),
                                    3.heightBox,
                                    Text(
                                      "${state.weather.tempMin!.celsius!.round()}°C",
                                      style: AppTextStyle.s13Bold,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else if (state is TempFailedState) {
                  return Center(
                    child: Text(
                      state.error,
                      style: AppTextStyle.s18Med,
                    ),
                  );
                } else
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: AppColor.primaryColor),
                        10.heightBox,
                        const Text("Please Wait...")
                      ],
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/1.png',
          scale: 1.7,
        );
      case >= 300 && < 400:
        return Image.asset('assets/2.png', scale: 1.7);
      case >= 500 && < 600:
        return Image.asset('assets/3.png', scale: 1.7);
      case >= 600 && < 700:
        return Image.asset('assets/4.png', scale: 1.7);
      case >= 700 && < 800:
        return Image.asset('assets/5.png', scale: 1.7);
      case == 800:
        return Image.asset('assets/6.png', scale: 1.7);
      case > 800 && <= 804:
        return Image.asset('assets/7.png', scale: 1.7);
      default:
        return Image.asset('assets/7.png', scale: 1.7);
    }
  }

  // signup function

  _signupWidget(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you Sure?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            ElevatedButton(
                onPressed: () {
                  FirebaseRepository.signout(context);
                },
                child: const Text("Logout"))
          ],
        );
      },
    );
  }
}
