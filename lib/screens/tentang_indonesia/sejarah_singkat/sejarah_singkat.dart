import 'package:flutter/material.dart';

import '../../../services/sejarah_singkat_service.dart';
import '../../../utils/constant.dart';

class SejarahSingkat extends StatefulWidget {
  const SejarahSingkat({Key? key}) : super(key: key);
  static String routeName = '/list-indo/sejarah-singkat';
  @override
  State<SejarahSingkat> createState() => _SejarahSingkatState();
}

class _SejarahSingkatState extends State<SejarahSingkat> {
  String result1 = 'Result 1';
  Future<List>? _futureSejarah;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _futureSejarah = SejarahSingkatService().getSejarahSingkat();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sejarah Singkat'),
      ),
      body: FutureBuilder<List>(
        future: _futureSejarah,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Image.asset('assets/images/sejarah.jfif'),
                      const SizedBox(height: 8),
                      Text(
                        snapshot.data![0].toString(),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: Text(
                            'Source @Wikipedia',
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
              ),
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
