import 'package:catbreeds/models/breed.dart';
import 'package:catbreeds/services/cat_breeds.dart';
import 'package:flutter/material.dart';

class BreedsProvider extends ChangeNotifier {
  List<Breed> _breeds = [];
  List<Breed> _suggestionBreeds = [];
  final int _limit = 10;
  int _page = 0;
  bool _isLoading = true;
  String _query = "a";
  Future resetAll() async {
    _breeds = [];
    _page = 0;
    _query = "a";
    await getBreeds();
  }

  getBreeds() async {
    _isLoading = true;
    final response = await CatBreedsService().getCatsBreeds({'limit': _limit, 'page': _page, 'q': _query});
    _breeds.addAll(response ?? []);
    _suggestionBreeds = [...breeds];
    _isLoading = false;
    notifyListeners();
  }

  getBreedsNewPage() {
    _page++;
    getBreeds();
  }

  searchBreed(String value) {
    _query = value.isEmpty ? "a" : value;
    _breeds.clear();
    getBreeds();
  }

  searchBreedSuggestion(String value) {
    if (value.isEmpty) {
      _suggestionBreeds = [...breeds];
    } else {
      _suggestionBreeds.clear();
      _suggestionBreeds = _breeds.where((item) => item.name!.contains(value)).toList();
    }
    notifyListeners();
  }

  List<Breed> get breeds {
    return _breeds;
  }

  int get limit {
    return _limit;
  }

  int get page {
    return _page;
  }

  bool get isLoading {
    return _isLoading;
  }

  String get query {
    return _query;
  }

  List<Breed> get suggestionBreeds {
    return _suggestionBreeds;
  }
}
