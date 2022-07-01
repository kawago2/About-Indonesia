import 'package:about_indonesia/models/argument_model.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_sekolah/list_byname.dart';
import 'package:about_indonesia/widgets/button_search.dart';
import 'package:flutter/material.dart';

class ListSekolahScreen extends StatefulWidget {
  ListSekolahScreen({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo/list-sekolah';
  @override
  State<ListSekolahScreen> createState() => _ListSekolahScreenState();
}

class _ListSekolahScreenState extends State<ListSekolahScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Sekolah'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text('Cari berdasarkan nama sekolah'),
            SizedBox(height: 5),
            Text('contoh: sman 13'),
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
            ButtonSearchBuild(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SekolahByName.routeName,
                  arguments: ArgueByname(nameController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
