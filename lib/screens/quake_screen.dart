import 'package:about_indonesia/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/quake_model.dart';
import '../services/quake_service.dart';
import '../utils/api.dart';

class QuakeScreen extends StatefulWidget {
  QuakeScreen({Key? key}) : super(key: key);
  static String routeName = '/quake';
  @override
  State<QuakeScreen> createState() => _QuakeScreenState();
}

class _QuakeScreenState extends State<QuakeScreen> {
  late Future<Quake> futureQuake;

  @override
  void initState() {
    super.initState();
    futureQuake = QuakeService().getQuake();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deteksi Gempa',
        ),
      ),
      body: Center(
        child: FutureBuilder<Quake>(
          future: futureQuake,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        QuakeApiConstants.baseUrl + snapshot.data!.shakemap,
                      ),
                      TextBuilder(
                        title: 'Tanggal Kejadian : ${snapshot.data!.tanggal}',
                      ),
                      TextBuilder(
                        title: 'Waktu Kejadian : ${snapshot.data!.jam}',
                      ),
                      TextBuilder(
                        title: DateFormat.yMMMMEEEEd('id_ID')
                            .format(snapshot.data!.datetime),
                      ),
                      TextBuilder(
                        title: 'Koordinat : ${snapshot.data!.coordinates}',
                      ),
                      TextBuilder(
                        title: 'Lintang : ${snapshot.data!.lintang}',
                      ),
                      TextBuilder(
                        title: 'Bujur : ${snapshot.data!.bujur}',
                      ),
                      TextBuilder(
                        title: 'Magnitude : ${snapshot.data!.magnitude}',
                      ),
                      TextBuilder(
                        title: 'Kedalaman : ${snapshot.data!.kedalaman}',
                      ),
                      TextBuilder(
                        title: 'Wilayah : ${snapshot.data!.wilayah}',
                      ),
                      TextBuilder(
                        title: 'Potensi : ${snapshot.data!.potensi}',
                      ),
                      TextBuilder(
                        title: 'Dirasakan oleh : ${snapshot.data!.dirasakan}',
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: Text(
                            'Source @BMKG',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class TextBuilder extends StatelessWidget {
  String title;
  TextBuilder({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(),
        ),
      ],
    );
  }
}
