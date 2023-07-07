import 'package:sundevs/dio/httpdio.dart';
import 'package:sundevs/dio/parseresponse.dart';
import 'package:sundevs/models/models.dart';
import 'package:sundevs/repositories/comics/base_comics_repository.dart';

class ComicsRepository extends BaseComicsRepository {
  final HttpDio _httpDio;
  final ParseResponse _parseResponse;

  ComicsRepository({ParseResponse? parseResponse, HttpDio? httpDio})
      : _httpDio = httpDio ?? HttpDio.getInstance(null),
        _parseResponse = parseResponse ?? ParseResponse.instance;

  @override
  Future<Comics> getAllComics() async {
    var response = await _httpDio.dio.get('issues/');
    var parsedData = _parseResponse.parseResponse<Comics>(
        response, (elemento) => Comics.fromJson(elemento));
    return parsedData;
  }
}
