import '/models/models.dart';

abstract class BaseComicsRepository {
  Future<Comics> getAllComics();
}
