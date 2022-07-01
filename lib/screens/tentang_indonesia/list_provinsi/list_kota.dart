
import 'package:flutter/material.dart';

import '../../../models/argument_model.dart';
import '../../../models/kotakabupaten_model.dart';
import '../../../services/kotakabupaten_service.dart';
import 'list_kecamatan.dart';

class KotaScreen extends StatefulWidget {
  KotaScreen({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-provinsi/list-kota';
  @override
  State<KotaScreen> createState() => _KotaScreenState();
}

class _KotaScreenState extends State<KotaScreen> {
  Future<KotaKabupaten>? _futureKotaKabupaten;
  var args;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)!.settings.arguments! as ScreenArguments;
        _futureKotaKabupaten =
            KotaKabupatenService().getKotaKabupaten(args.id.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name!),
      ),
      body: FutureBuilder<KotaKabupaten>(
        future: _futureKotaKabupaten,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.kotaKabupaten!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, KecamatanScreen.routeName, arguments: ScreenArguments(
                            snapshot.data!.kotaKabupaten![index].id!,
                            snapshot.data!.kotaKabupaten![index].nama!));
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '${index + 1}. ${snapshot.data!.kotaKabupaten![index].nama}',
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

  @override
  void dispose() {
    super.dispose();
  }
}

