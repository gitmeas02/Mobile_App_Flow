import 'package:flutter/material.dart';
import 'package:my_project/features/favorite/data/model/favorite_model.dart';
import 'package:my_project/features/favorite/presentation/widgets/add_all_to_card.dart';
import 'package:my_project/features/favorite/presentation/widgets/favorite_card.dart';
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        centerTitle: true,
      ),
      body:
         ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: favoriteModel.length,
            separatorBuilder: (_,__) => const Divider(),
            itemBuilder: (context,index){
              return FavoriteCard(item:favoriteModel[index]);
            },
          ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: AddAllToCard(),
        )
    );
  }
}