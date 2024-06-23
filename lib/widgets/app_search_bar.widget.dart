import 'package:catbreeds/providers/breeds.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'CatBreeds',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SearchBar(
            hintText: 'Search Breed',
            trailing: const <Widget>[Icon(Icons.search)],
            onSubmitted: (value) => context.read<BreedsProvider>().searchBreed(value),
          )
        ],
      ),
    );
  }
}
