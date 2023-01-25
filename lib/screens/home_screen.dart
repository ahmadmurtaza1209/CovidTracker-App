// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:covid_tracker_app/models/covid_global_model.dart';
import 'package:covid_tracker_app/screens/countries_list_screen.dart';
import 'package:covid_tracker_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.detail});

  final CovidGlobalModel? detail;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colorList = [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  Future<CovidGlobalModel> globalData() async {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/all");
    http.Response response = await http.get(uri);

    var decodebody = jsonDecode(response.body);

    CovidGlobalModel obj = CovidGlobalModel.fromJson(decodebody);

    return obj;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: const Color.fromARGB(255, 65, 65, 65),
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 49, 49, 49),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                  child: Center(),
                  flex: 1,
                ),
                FutureBuilder<CovidGlobalModel>(
                    future: globalData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<CovidGlobalModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  // margin: EdgeInsets.only(top: height * 0.05),
                                  child: PieChart(
                                dataMap: <String, double>{
                                  "Total": double.parse(
                                      snapshot.data!.cases.toString()),
                                  "Recovered": double.parse(
                                      snapshot.data!.recovered.toString()),
                                  "Deaths": double.parse(
                                      snapshot.data!.deaths.toString())
                                },
                                chartLegendSpacing: 52,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 3.5,
                                colorList: colorList,
                                chartType: ChartType.ring,
                                ringStrokeWidth: 13,
                                legendOptions: const LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition: LegendPosition.left,
                                  showLegends: true,
                                  legendShape: BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 179, 175, 175),
                                  ),
                                ),
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                    decimalPlaces: 1,
                                    chartValueStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )),
                              SizedBox(
                                height: height * 0.07,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: width * 0.04,
                                  right: width * 0.04,
                                ),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 65, 65, 65),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      // minVerticalPadding: -4,
                                      title: const Text(
                                        "Total",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.cases.toString(),
                                        style: const TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      indent: width * 0.04,
                                      endIndent: width * 0.04,
                                      height: height * 0.005,
                                      thickness: 0.5,
                                      color: Color.fromARGB(255, 179, 175, 175),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Recovered",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.recovered.toString(),
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      indent: width * 0.04,
                                      endIndent: width * 0.04,
                                      height: height * 0.005,
                                      thickness: 0.5,
                                      color: Color.fromARGB(255, 179, 175, 175),
                                    ),
                                    ListTile(
                                      title: const Text(
                                        "Deaths",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.deaths.toString(),
                                        style: const TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      indent: width * 0.04,
                                      endIndent: width * 0.04,
                                      height: height * 0.005,
                                      thickness: 0.5,
                                      color: Color.fromARGB(255, 179, 175, 175),
                                    ),
                                    ListTile(
                                      title: const Text(
                                        "Active",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.active.toString(),
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      indent: width * 0.04,
                                      endIndent: width * 0.04,
                                      height: height * 0.005,
                                      thickness: 0.5,
                                      color: Color.fromARGB(255, 179, 175, 175),
                                    ),
                                    ListTile(
                                      title: const Text(
                                        "Critical",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.critical.toString(),
                                        style: const TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      indent: width * 0.04,
                                      endIndent: width * 0.04,
                                      height: height * 0.005,
                                      thickness: 0.5,
                                      color: Color.fromARGB(255, 179, 175, 175),
                                    ),
                                    ListTile(
                                      title: const Text(
                                        "Today Deaths",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.todayDeaths.toString(),
                                        style: const TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      indent: width * 0.04,
                                      endIndent: width * 0.04,
                                      height: height * 0.005,
                                      thickness: 0.5,
                                      color: Color.fromARGB(255, 179, 175, 175),
                                    ),
                                    ListTile(
                                      title: const Text(
                                        "Today Recovered",
                                        style: TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Text(
                                        snapshot.data!.todayRecovered
                                            .toString(),
                                        style: const TextStyle(
                                            // fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 179, 175, 175),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]);
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            "Error Occurs",
                            style: TextStyle(fontSize: 25, color: Colors.red),
                          ),
                        );
                      }

                      return Container();
                    }),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CountriesListScreen()));
                    },
                    child: Container(
                      height: height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 16, 162, 91),
                          borderRadius: BorderRadius.circular(7)),
                      child: const Text(
                        "Track Countries",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 199, 197, 197),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Center(),
                  flex: 1,
                ),
              ],
            ),
          ),
        ));
  }
}
