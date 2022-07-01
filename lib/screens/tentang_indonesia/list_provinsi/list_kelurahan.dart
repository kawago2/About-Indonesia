import 'package:flutter/material.dart';

import '../../../models/argument_model.dart';
import '../../../models/kelurahan_model.dart';
import '../../../services/kelurahan_service.dart';

class KelurahanScreen extends StatefulWidget {
  KelurahanScreen({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-provinsi/list-kelurahan';
  @override
  State<KelurahanScreen> createState() => _KelurahanScreenState();
}

class _KelurahanScreenState extends State<KelurahanScreen> {
  Future<Kelurahan>? _futureKelurahan;
  var args;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)!.settings.arguments! as ScreenArguments;
        _futureKelurahan = KelurahanService().getKelurahan(args.id.toString());
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
      body: FutureBuilder<Kelurahan>(
        future: _futureKelurahan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.kelurahan!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '${index + 1}. ${snapshot.data!.kelurahan![index].nama}',
                      style: TextStyle(
                           fontSize: 18,
                        fontWeight: FontWeight.bold,
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
