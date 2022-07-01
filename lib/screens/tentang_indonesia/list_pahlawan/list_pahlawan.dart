import 'package:about_indonesia/models/argument_model.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_pahlawan/list_bydate.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_pahlawan/list_byq.dart';
import 'package:about_indonesia/utils/propotionate.dart';
import 'package:about_indonesia/widgets/button_search.dart';
import 'package:flutter/material.dart';


class ListPahlawanScreen extends StatefulWidget {
  ListPahlawanScreen({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-pahlawan';

  @override
  State<ListPahlawanScreen> createState() => _ListPahlawanScreenState();
}

class _ListPahlawanScreenState extends State<ListPahlawanScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController startdController = TextEditingController();
  TextEditingController enddController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    startdController = TextEditingController();
    enddController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    startdController.dispose();
    enddController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Pahlawan'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cari berdasarkan nama pahlawan atau kata kunci'),
                SizedBox(height: 5),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
                Center(
                  child: ButtonSearchBuild(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PahlawanByQuery.routeName,
                        arguments: ArgueByname(
                          nameController.text.toLowerCase(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cari pahlawan yang hidup di periode tertentu'),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Start date'),
                        SizedBox(height: 5),
                        SizedBox(
                          width: MyUtility(context).width * 0.2,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: startdController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('End date'),
                        SizedBox(height: 5),
                        SizedBox(
                          width: MyUtility(context).width * 0.2,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: enddController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Center(
                  child: ButtonSearchBuild(
                    onPressed: () {
                      Navigator.pushNamed(context, PahlawanByDate.routeName,
                          arguments: ArgueBydate(
                              int.parse(startdController.text),
                              int.parse(enddController.text)));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
