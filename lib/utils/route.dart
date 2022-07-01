import 'package:about_indonesia/screens/tentang_indonesia/list_pahlawan/list_bydate.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_pahlawan/list_pahlawan.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_provinsi/list_kecamatan.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_sekolah/list_byname.dart';
import 'package:about_indonesia/screens/tentang_indonesia/list_sekolah/list_sekolah.dart';
import 'package:about_indonesia/screens/tentang_indonesia/sejarah_singkat/sejarah_singkat.dart';
import 'package:flutter/widgets.dart';

import '../screens/faktaharian_screen.dart';
import '../screens/home_screen.dart';
import '../screens/kbbi_screen.dart';
import '../screens/nasional_screen.dart';
import '../screens/quake_screen.dart';
import '../screens/tentang_indonesia/list_pahlawan/list_byq.dart';
import '../screens/tentang_indonesia/list_provinsi/list_kelurahan.dart';
import '../screens/tentang_indonesia/list_provinsi/list_kota.dart';
import '../screens/tentang_indonesia/list_provinsi/list_provinsi.dart';
import '../screens/tentang_indonesia/list_tentangindo.dart';
import '../screens/wellcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WellcomeScreen.routeName: (context) => const WellcomeScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  QuakeScreen.routeName: (context) => QuakeScreen(),
  KbbiScreen.routeName: (context) => KbbiScreen(),
  NasionalScreen.routeName: (context) => const NasionalScreen(),
  FaktaHarianScreen.routeName: (context) => FaktaHarianScreen(),
  TentangIndonesia.routeName: (context) => const TentangIndonesia(),
  ListProvinsiScreen.routeName: (context) => const ListProvinsiScreen(),
  KotaScreen.routeName: (context) => KotaScreen(),
  KecamatanScreen.routeName: (context) => KecamatanScreen(),
  KelurahanScreen.routeName: (context) => KelurahanScreen(),
  ListPahlawanScreen.routeName: (context) => ListPahlawanScreen(),
  PahlawanByQuery.routeName: (context) => PahlawanByQuery(),
  PahlawanByDate.routeName: (context) => PahlawanByDate(),
  ListSekolahScreen.routeName: (context) => ListSekolahScreen(),
  SekolahByName.routeName: (context) => SekolahByName(),
  SejarahSingkat.routeName: (context) => SejarahSingkat(),
};
