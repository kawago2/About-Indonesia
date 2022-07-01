import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/nasional_model.dart';
import '../services/nasional_service.dart';

class NasionalScreen extends StatefulWidget {
  const NasionalScreen({Key? key}) : super(key: key);
  static String routeName = '/berita-nasional';
  @override
  State<NasionalScreen> createState() => _NasionalScreenState();
}

class _NasionalScreenState extends State<NasionalScreen> {
  Future<Nasional>? _futureNasional;
  @override
  void initState() {
    super.initState();
    _futureNasional = NasionalService().getNasional();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Nasional'),
      ),
      body: FutureBuilder<Nasional>(
        future: _futureNasional,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.data![index].title!,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Image.network(
                            snapshot.data!.data![index].image!.large!),
                        SizedBox(height: 5),
                        Text(
                          snapshot.data!.data![index].contentSnippet!,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Jam release ${DateFormat.Hm('id_ID').format(snapshot.data!.data![index].isoDate!)}',
                        ),
                        SizedBox(height: 5),
                        Text('Link Source'),
                        GestureDetector(
                          onTap: () => launchUrl(
                            Uri.parse(snapshot.data!.data![index].link!),
                          ),
                          child: Text(
                            snapshot.data!.data![index].link!,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        ),
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


/*
ListTile(
                    title: Text(
                      snapshot.data!.data![index].title.toString(),
                    ),
                    subtitle: Text(
                      snapshot.data!.data![index].contentSnippet.toString(),
                    ),
                    
                  ),
                  */