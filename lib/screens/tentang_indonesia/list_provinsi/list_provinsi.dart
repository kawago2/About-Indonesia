import 'package:flutter/material.dart';

import '../../../models/argument_model.dart';
import '../../../models/list_provinsi_model.dart';
import '../../../services/list_provinsi_service.dart';
import 'list_kota.dart';

class ListProvinsiScreen extends StatefulWidget {
  const ListProvinsiScreen({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-provinsi';
  @override
  State<ListProvinsiScreen> createState() => _ListProvinsiScreenState();
}

class _ListProvinsiScreenState extends State<ListProvinsiScreen> {
  Future<ListProvinsi>? _futureListProvinsi;
  @override
  void initState() {
    super.initState();
    _futureListProvinsi = ListProvinsiService().getListProvinsi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Provinsi'),
      ),
      body: FutureBuilder<ListProvinsi>(
        future: _futureListProvinsi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.provinsi!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, KotaScreen.routeName,
                        arguments: ScreenArguments(
                            snapshot.data!.provinsi![index].id!,
                            snapshot.data!.provinsi![index].nama!));
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '${index + 1}. ${snapshot.data!.provinsi![index].nama!}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text('Please Wait'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

