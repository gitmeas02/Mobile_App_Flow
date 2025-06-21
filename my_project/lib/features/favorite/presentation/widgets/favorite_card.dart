import 'package:flutter/material.dart';
import 'package:my_project/features/favorite/data/model/favorite_model.dart';

class FavoriteCard extends StatelessWidget {
 final FavoriteModel item; 
  const FavoriteCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name ,style: TextStyle(color: Colors.black,fontSize: 16),),
                  Text("${item.ml}ml,Price",style: TextStyle(color: Color(0xFF7c7c7c),fontSize: 14),)
                ],
              ),
              Row(
                children: [
                  Text("\$${item.price}",style: TextStyle(color: Colors.black,fontSize: 16),),
                  Icon(Icons.chevron_right,
                  color: Colors.black,
                  size: 24,
                  
                  )
                ],
              ),
              Image.asset(item.image,width: 56,height: 70,)
            ],
          );
  }
}