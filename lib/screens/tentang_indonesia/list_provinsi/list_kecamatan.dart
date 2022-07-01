import 'package:about_indonesia/screens/tentang_indonesia/list_provinsi/list_kelurahan.dart';
import 'package:flutter/material.dart';

import '../../../models/argument_model.dart';
import '../../../models/kecamatan_model.dart';
import '../../../services/kecamatan_service.dart';

class KecamatanScreen extends StatefulWidget {
  KecamatanScreen({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-provinsi/list-kecamatan';
  @override
  State<KecamatanScreen> createState() => _KecamatanScreenState();
}

class _KecamatanScreenState extends State<KecamatanScreen> {
  Future<Kecamatan>? _futureKecamatan;
  var args;
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)!.settings.arguments! as ScreenArguments;
        _futureKecamatan = KecamatanService().getKecamatan(args.id.toString());
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
      body: FutureBuilder<Kecamatan>(
        future: _futureKecamatan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.kecamatan!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, KelurahanScreen.routeName,
                        arguments: ScreenArguments(
                            snapshot.data!.kecamatan![index].id!,
                            snapshot.data!.kecamatan![index].nama!));
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '${index + 1}. ${snapshot.data!.kecamatan![index].nama}',
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
