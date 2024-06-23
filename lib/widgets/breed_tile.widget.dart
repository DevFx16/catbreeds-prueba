import 'package:catbreeds/models/breed.dart';
import 'package:catbreeds/pages/detail.page.dart';
import 'package:flutter/material.dart';

class BreedTile extends StatelessWidget {
  final Breed tile;
  const BreedTile({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tile.name!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage(tile: tile)));
                    },
                    icon: const Icon(Icons.visibility),
                  )
                ],
              ),
            ),
            FadeInImage(
              image: NetworkImage(tile.image!.url!),
              placeholder: const AssetImage('assets/images/loading.gif'),
              fit: BoxFit.scaleDown,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tile.origin!),
                  Text(tile.countryCode!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
