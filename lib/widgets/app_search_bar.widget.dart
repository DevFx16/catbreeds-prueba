import 'package:catbreeds/pages/detail.page.dart';
import 'package:catbreeds/providers/breeds.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    final BreedsProvider provider = context.read<BreedsProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'CatBreeds',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SearchAnchor(
            viewOnChanged: provider.searchBreedSuggestion,
            viewOnSubmitted: provider.searchBreed,
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return provider.suggestionBreeds.map((breed) {
                return ListTile(
                  title: Text(breed.name!),
                  leading: CircleAvatar(backgroundImage: NetworkImage(breed.image!.url!)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage(tile: breed)));
                  },
                );
              }).toList();
            },
            builder: (BuildContext context, SearchController controller) => SearchBar(
              controller: controller,
              hintText: 'Search Breed',
              padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
              trailing: const <Widget>[Icon(Icons.search)],
              onSubmitted: (value) => context.read<BreedsProvider>().searchBreed(value),
              onTap: () {
                controller.openView();
              },
              onChanged: (value) {
                controller.openView();
              },
            ),
          )
        ],
      ),
    );
  }
}
