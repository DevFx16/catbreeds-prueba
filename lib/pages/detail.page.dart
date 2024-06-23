import 'package:catbreeds/models/breed.dart';
import 'package:catbreeds/widgets/more_info.widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Breed tile;
  const DetailPage({super.key, required this.tile});

  textDetail(String value) => Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.justify,
        textScaler: const TextScaler.linear(1.2),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tile.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FadeInImage(
                    image: NetworkImage(tile.image!.url!),
                    placeholder: const AssetImage('assets/images/loading.gif'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textDetail(tile.description!),
                    const SizedBox(height: 15),
                    textDetail(tile.origin!),
                    textDetail('LifeSpan: ${tile.lifeSpan!}'),
                    ...tile.temperament!.split(",").map((item) => textDetail(item.trim())),
                    Center(
                      child: MoreInfo(
                        icons: [
                          {'icon': 'https://cdn-icons-png.flaticon.com/512/253/253789.png', 'url': tile.wikipediaUrl},
                          {'icon': 'https://seeklogo.com/images/C/cfa-institute-logo-8013C61264-seeklogo.com.png', 'url': tile.cfaUrl},
                          {'icon': 'https://www.vetstreet.com/wp-content/uploads/2022/08/vetstreet-logo-colored.png', 'url': tile.vetstreetUrl}
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
