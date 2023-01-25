import 'package:covid_tracker_app/models/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  final CountriesModel data;
  const DetailScreen({super.key, required this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: const Color.fromARGB(255, 65, 65, 65),
              statusBarIconBrightness: Brightness.light),
          backgroundColor: const Color.fromARGB(255, 65, 65, 65),
          elevation: 0,
          title: Text(
            widget.data.country,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Flexible(
              child: Center(),
              flex: 1,
            ),
            Stack(children: [
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.04,
                    right: width * 0.04,
                    top: height * 0.07),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 65, 65, 65),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height * 0.06),
                      child: ListTile(
                        title: const Text(
                          "Cases",
                          style: TextStyle(
                              // fontSize: 16,
                              color: Color.fromARGB(255, 179, 175, 175),
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          widget.data.cases.toString(),
                          style: const TextStyle(
                              // fontSize: 16,
                              color: Color.fromARGB(255, 179, 175, 175),
                              fontWeight: FontWeight.bold),
                        ),
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
                        "Recovered",
                        style: TextStyle(
                            // fontSize: 16,
                            color: Color.fromARGB(255, 179, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        widget.data.recovered.toString(),
                        style: const TextStyle(
                            // fontSize: 16,
                            color: Color.fromARGB(255, 179, 175, 175),
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
                            color: Color.fromARGB(255, 179, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        widget.data.deaths.toString(),
                        style: const TextStyle(
                            // fontSize: 16,
                            color: Color.fromARGB(255, 179, 175, 175),
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
                            color: Color.fromARGB(255, 179, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        widget.data.active.toString(),
                        style: const TextStyle(
                            // fontSize: 16,
                            color: Color.fromARGB(255, 179, 175, 175),
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
                            color: Color.fromARGB(255, 179, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        widget.data.critical.toString(),
                        style: const TextStyle(
                            // fontSize: 16,
                            color: Color.fromARGB(255, 179, 175, 175),
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
                            color: Color.fromARGB(255, 179, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        widget.data.todayRecovered.toString(),
                        style: const TextStyle(
                            // fontSize: 16,
                            color: Color.fromARGB(255, 179, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      widget.data.countryInfo.flag,
                    ),
                  )
                ],
              )
            ]),
            const Flexible(
              child: Center(),
              flex: 1,
            ),
          ]),
        ));
  }
}
