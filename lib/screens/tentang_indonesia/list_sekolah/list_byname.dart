import 'package:about_indonesia/models/sekolah_model.dart';
import 'package:flutter/material.dart';

import '../../../models/argument_model.dart';
import '../../../services/sekolah_service.dart';

class SekolahByName extends StatefulWidget {
  SekolahByName({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-sekolah/byname';
  @override
  State<SekolahByName> createState() => _SekolahByNameState();
}

class _SekolahByNameState extends State<SekolahByName> {
  var args;

  Future<Sekolah>? _futureSekolah;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)!.settings.arguments! as ArgueByname;
        _futureSekolah = SekolahService().getSekolahName(args.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgueByname;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari : ${args.name!}'),
      ),
      body: FutureBuilder<Sekolah>(
        future: _futureSekolah,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.dataSekolah!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.dataSekolah![index].sekolah!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            '${snapshot.data!.dataSekolah![index].propinsi!} (\t\t${snapshot.data!.dataSekolah![index].kodeProp!})'),
                        Text(
                            '${snapshot.data!.dataSekolah![index].kabupatenKota!} (\t\t${snapshot.data!.dataSekolah![index].kodeKabKota!})'),
                        Text(
                            '${snapshot.data!.dataSekolah![index].kecamatan!} (\t\t${snapshot.data!.dataSekolah![index].kodeKec})'),
                        Text(
                            'NPSN : ${snapshot.data!.dataSekolah![index].npsn!}'),
                        Text(
                            'Alamat : ${snapshot.data!.dataSekolah![index].alamatJalan!}'),
                      ],
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
