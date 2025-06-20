import 'package:flutter/material.dart';
import 'plant_grid_card.dart';

class PlantCard extends StatelessWidget {
  final Plant? plant;

  const PlantCard({super.key, this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      width: 175,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.asset(
            plant?.imagePath ?? 'assets/images/plant.png',
            width: 130,
            height: 110,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              plant?.name ?? 'Name',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              plant?.description ?? 'Description',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${plant?.price?.toStringAsFixed(2) ?? '4.99'}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF53B175),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white, size: 26),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
