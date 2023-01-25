import 'dart:convert';

import 'package:covid_tracker_app/models/countries_model.dart';
import 'package:covid_tracker_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  List<CountriesModel> countryList = [];
  Future<List<CountriesModel>> getCountry() async {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/countries");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    for (int i = 0; i < decodeData.length; i++) {
      CountriesModel obj = CountriesModel.fromJson(decodeData[i]);
      // print(response.body);
      countryList.add(obj);
    }
    // print(countryList);
    return countryList;
  }

  List<CountriesModel> searchList = [];
  void search(String text) {
    for (int i = 0; i < countryList.length; i++) {
      if (text == countryList[i].country) {
        CountriesModel obj = countryList[i];
        searchList.add(obj);
        break;
      } else if (text == "") {
        searchList = countryList;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchList.clear();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color.fromARGB(255, 65, 65, 65),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: const Color.fromARGB(255, 49, 49, 49),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                  child: TextFormField(
                    controller: searchController,
                    onFieldSubmitted: (value) {
                      setState(() {
                        search(searchController.text);
                      });
                    },
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                        constraints: BoxConstraints(maxHeight: height * 0.07),
                        contentPadding: EdgeInsets.only(
                            top: height * 0.014, left: width * 0.05),
                        hintText: "search with country name",
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                FutureBuilder<List<CountriesModel>>(
                    future: getCountry(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CountriesModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return searchList.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: height * 0.03),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          CountriesModel screenData =
                                              snapshot.data![index];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailScreen(
                                                            data: screenData,
                                                          )));
                                            },
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: height * 0.03,
                                                        left: width * 0.04,
                                                        right: width * 0.04),
                                                    width: width,
                                                    // color: Colors.blue,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: height * 0.05,
                                                          width: width * 0.15,
                                                          // color: Colors.green,
                                                          child: Image.network(
                                                            screenData
                                                                .countryInfo
                                                                .flag,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.05,
                                                        ),
                                                        Container(
                                                          // color: Colors.blue,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                child: Text(
                                                                  screenData
                                                                      .country,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    top: height *
                                                                        0.007),
                                                                child: Text(
                                                                  screenData
                                                                      .cases
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              )
                            : Container(
                                margin: EdgeInsets.only(bottom: height * 0.03),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: searchList.length,
                                    itemBuilder: (BuildContext context, index) {
                                      CountriesModel screenData =
                                          searchList[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                        data: screenData,
                                                      )));
                                        },
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: height * 0.03,
                                                    left: width * 0.04,
                                                    right: width * 0.04),
                                                width: width,
                                                // color: Colors.blue,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: height * 0.05,
                                                      width: width * 0.15,
                                                      // color: Colors.green,
                                                      child: Image.network(
                                                        screenData
                                                            .countryInfo.flag,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.05,
                                                    ),
                                                    Container(
                                                      // color: Colors.blue,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              screenData
                                                                  .country,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: height *
                                                                        0.007),
                                                            child: Text(
                                                              screenData.cases
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text(
                          "Errror occurs",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ));
                      }
                      return Container();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
