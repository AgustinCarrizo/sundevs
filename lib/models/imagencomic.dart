import 'package:sundevs/models/models.dart';

class ImagenComic {
  final Results? detail;
  final List<Imagen> chacarter;
  final List<Imagen>location;
  final List<Imagen> credits;
  ImagenComic(
      {required this.detail,
      required this.chacarter,
      required this.location,
      required this.credits});
}
