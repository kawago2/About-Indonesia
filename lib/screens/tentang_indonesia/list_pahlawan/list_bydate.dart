import 'package:about_indonesia/models/argument_model.dart';
import 'package:flutter/material.dart';

import '../../../models/pahlawan_model.dart';
import '../../../services/pahlawan_service.dart';

class PahlawanByDate extends StatefulWidget {
  PahlawanByDate({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-pahlawan/bydate';

  @override
  State<PahlawanByDate> createState() => _PahlawanByDateState();
}

class _PahlawanByDateState extends State<PahlawanByDate> {
  var args;
  bool _isLoading = true;
  late List<Pahlawan>? _futurePahlawan = [];
  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments! as ArgueBydate;
    _getData();
  }

  void _getData() async {
    _futurePahlawan =
        (await PahlawanService().getperiode(args.start!, args.end!))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgueBydate;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Periode : ${args.start} - ${args.end}',
        ),
      ),
      body: _isLoading
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text('Please Wait'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _futurePahlawan!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${_futurePahlawan![index].name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Tahun lahir\t:\t${_futurePahlawan![index].birthYear}',
                        ),
                        Text(
                          'Tahun wafat\t:\t${_futurePahlawan![index].deathYear}',
                        ),
                        Text(
                          'Deskripsi\t:\n${_futurePahlawan![index].description}',
                        ),
                        Text(
                          'Tahun mikraj\t:\t${_futurePahlawan![index].ascensionYear}',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
