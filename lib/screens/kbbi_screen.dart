import 'package:about_indonesia/models/kbbi_model.dart';
import 'package:about_indonesia/services/kbbi_service.dart';
import 'package:about_indonesia/widgets/button_search.dart';
import 'package:flutter/material.dart';

class KbbiScreen extends StatefulWidget {
  KbbiScreen({Key? key}) : super(key: key);
  static String routeName = '/kbbi';
  @override
  State<KbbiScreen> createState() => _KbbiScreenState();
}

class _KbbiScreenState extends State<KbbiScreen> {
  Future<Kbbi>? _futureKbbi;
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void _getData() async {
    setState(() {
      _futureKbbi = KbbiService().getKbbi(nameController.text.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KBBI'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<Kbbi>(
              future: _futureKbbi,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Text(
                        nameController.text.toLowerCase(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.data![index].lema,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot
                                              .data!.data![index].arti!.length <
                                          5
                                      ? snapshot.data!.data![index].arti!.length
                                      : 5,
                                  itemBuilder: (BuildContext context, int pox) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.data![index].arti![pox]
                                              .kelasKata,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          snapshot.data!.data![index].arti![pox]
                                              .deskripsi,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  })
                            ],
                          );
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Fitur Terbatas'),
                      SizedBox(height: 15),
                      Text('Masukkan kata terlebih dahulu'),
                    ],
                  ),
                );
              },
            ),
            Column(
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Masukkan Kata',
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ButtonSearchBuild(
                    onPressed: () {
                      _getData();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
