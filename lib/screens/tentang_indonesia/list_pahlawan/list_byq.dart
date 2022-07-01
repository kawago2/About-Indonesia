import 'package:about_indonesia/models/argument_model.dart';
import 'package:about_indonesia/models/pahlawan_model.dart';
import 'package:about_indonesia/services/pahlawan_service.dart';
import 'package:flutter/material.dart';

class PahlawanByQuery extends StatefulWidget {
  PahlawanByQuery({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-pahlawan/byquery';

  @override
  State<PahlawanByQuery> createState() => _PahlawanByQueryState();
}

class _PahlawanByQueryState extends State<PahlawanByQuery> {
  var args;
  bool _isLoading = true;
  late List<Pahlawan>? _futurePahlawan = [];
  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments! as ArgueByname;
    _getData();
  }

  void _getData() async {
    _futurePahlawan = (await PahlawanService().getKatakunci(args.name!))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgueByname;
    return Scaffold(
      appBar: AppBar(
        title: Text('Kata Kunci : ${args.name!}'),
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
