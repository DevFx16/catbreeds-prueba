import 'package:catbreeds/providers/breeds.provider.dart';
import 'package:catbreeds/widgets/breed_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScroll extends StatefulWidget {
  const ListScroll({super.key});

  @override
  State<ListScroll> createState() => _ListScrollState();
}

class _ListScrollState extends State<ListScroll> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        context.read<BreedsProvider>().getBreedsNewPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BreedsProvider>();
    return ListView.builder(
      controller: _controller,
      itemCount: provider.breeds.length + 1,
      itemBuilder: (context, index) {
        if (index >= provider.breeds.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return BreedTile(tile: provider.breeds[index]);
        }
      },
    );
  }
}
