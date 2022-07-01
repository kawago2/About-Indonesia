import 'package:flutter/material.dart';
import '../widgets/card_list.dart';
import '../widgets/mark.dart';
import 'faktaharian_screen.dart';
import 'kbbi_screen.dart';
import 'nasional_screen.dart';
import 'quake_screen.dart';
import 'tentang_indonesia/list_tentangindo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   
       
        title: Text(
          'About Indonesia',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListHomeBuild(),
          MarkCard(),
        ],
      ),
    );
  }
}

class ListHomeBuild extends StatelessWidget {
  const ListHomeBuild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardList(
          ontap: () {
            Navigator.pushNamed(context, QuakeScreen.routeName);
          },
          title: 'Deteksi Gempa Bumi',
          desc: 'By BMKG',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, KbbiScreen.routeName);
          },
          title: 'KBBI',
          desc: 'By btrianurdin - kemendikbud',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, NasionalScreen.routeName);
          },
          title: 'Berita Nasional',
          desc: 'By Satya Wikananda - CNN',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, FaktaHarianScreen.routeName);
          },
          title: 'Fakta Harian',
          desc: 'By Icaksh',
        ),
        CardList(
          ontap: () {
            Navigator.pushNamed(context, TentangIndonesia.routeName);
          },
          title: 'Tentang Indonesia',
          desc: '',
        ),
      ],
    );
  }
}
