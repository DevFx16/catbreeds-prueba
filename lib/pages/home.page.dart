import 'package:catbreeds/providers/breeds.provider.dart';
import 'package:catbreeds/widgets/app_search_bar.widget.dart';
import 'package:catbreeds/widgets/list_scroll.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<BreedsProvider>().getBreeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 130,
        flexibleSpace: const AppSearchBar(),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: context.read<BreedsProvider>().resetAll,
        child: const ListScroll(),
      ),
    );
  }
}
