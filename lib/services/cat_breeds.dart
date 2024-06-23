import 'package:catbreeds/models/breed.dart';
import 'package:catbreeds/services/api.dart';

class CatBreedsService extends Api {
  static final CatBreedsService _singleton = CatBreedsService._internal();
  factory CatBreedsService() {
    return _singleton;
  }

  CatBreedsService._internal();

  Future<List<Breed>?> getCatsBreeds(Map<String, dynamic>? params) async {
    try {
      if (params == null) {
        params = {'attach_image': 1};
      } else {
        params['attach_image'] = 1;
      }
      final response = await apiGet<List>('breeds/search', params);
      return response?.map((json) => Breed.fromJson(json)).toList();
    } catch (_) {
      return null;
    }
  }
}
