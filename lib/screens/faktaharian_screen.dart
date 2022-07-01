import 'package:flutter/material.dart';

import '../models/faktaharian_model.dart';
import '../services/fakta_harian_service.dart';

class FaktaHarianScreen extends StatefulWidget {
  FaktaHarianScreen({Key? key}) : super(key: key);
  static String routeName = '/fakta-harian';
  @override
  State<FaktaHarianScreen> createState() => _FaktaHarianScreenState();
}

class _FaktaHarianScreenState extends State<FaktaHarianScreen> {
  Future<FaktaHarian>? _futureFaktaHarian;
  @override
  void initState() {
    super.initState();
    _futureFaktaHarian = FaktaHarianService().getFaktaHarian();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fakta Harian',
        ),
      ),
      body: FutureBuilder<FaktaHarian>(
          future: _futureFaktaHarian,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fakta ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(snapshot.data!.data![index].tahukahAnda!),
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
          }),
    );
  }
}
