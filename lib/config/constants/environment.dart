import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theApiNewsKey =
      dotenv.env["THE_APINEWS_KEY"] ?? "No hay api key";
}
