class QuakeApiConstants {
  static String baseUrl = 'https://data.bmkg.go.id/DataMKG/TEWS/';
  static String usersEndpoint = 'autogempa.json';
}

class KbbiApiConstants {
  static String baseUrl = 'https://new-kbbi-api.herokuapp.com';
  static String usersEndpoint = '/cari/';
}

class NasionalApiConstants {
  static String baseUrl = 'https://berita-indo-api.vercel.app/v1/cnn-news';
  static String usersEndpoint = '/nasional';
}

class FaktaHarianApiConstants {
  static String baseUrl = 'https://cinnabar.icaksh.my.id';
  static String usersEndpoint = '/api/public/daily/wiki';
}

class ListProvinsiApiConstants {
  static String baseUrl = 'http://dev.farizdotid.com';
  static String usersEndpoint = '/api/daerahindonesia/provinsi';
}

class KotaKabupatenApiConstants {
  static String baseUrl = 'http://dev.farizdotid.com';
  static String usersEndpoint = '/api/daerahindonesia/kota?id_provinsi=';
}

class KecamatanApiConstants {
  static String baseUrl = 'https://dev.farizdotid.com';
  static String usersEndpoint = '/api/daerahindonesia/kecamatan?id_kota=';
}

class KelurahanApiConstants {
  static String baseUrl = 'https://dev.farizdotid.com';
  static String usersEndpoint = '/api/daerahindonesia/kelurahan?id_kecamatan=';
}

class PahlawanApiConstants {
  static String baseUrl = 'http://indonesia-public-static-api.vercel.app';
}

class SekolahApiConstants {
  static String baseUrl = 'https://api-sekolah-indonesia.herokuapp.com';
  static String usersEndpoint = '/sekolah/s?sekolah=';
}
