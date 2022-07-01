import 'package:about_indonesia/screens/tentang_indonesia/list_pahlawan/list_pahlawan.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_provinsi/list_provinsi.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_sekolah/list_sekolah.dart';
import 'package:about_indonesia/widgets/card_list.dart';
import 'package:about_indonesia/widgets/mark.dart';
import 'package:flutter/material.dart';

import 'sejarah_singkat/sejarah_singkat.dart';

class TentangIndonesia extends StatelessWidget {
  const TentangIndonesia({Key? key}) : super(key: key);
  static String routeName = '/tentang-indo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Indonesia'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ListTentangIndoBuild(),
          MarkCard(),
        ],
      ),
    );
  }
}

class ListTentangIndoBuild extends StatelessWidget {
  const ListTentangIndoBuild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardList(
          ontap: () {
            Navigator.pushNamed(context, ListProvinsiScreen.routeName);
          },
          title: 'List Provinsi',
          desc: 'By farizdotid',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, ListPahlawanScreen.routeName);
          },
          title: 'List Pahlawan',
          desc: 'By Yogi Saputro',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, ListSekolahScreen.routeName);
          },
          title: 'List Sekolah',
          desc: 'By wanrabbae',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, SejarahSingkat.routeName);
          },
          title: 'Sejarah Singkat',
          desc: 'Source wikipedia',
        ),
      ],
    );
  }
}
