import 'package:flutter/material.dart';

import '../../domain/model/area.dart';

class AreaCard extends StatelessWidget{
  final Area area;
  final VoidCallback onTap;
  const AreaCard({super.key, required this.area, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle area selection
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Color(0xFFD9E5D4), width: 1),
        ),
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          child: Text(
            area.strArea,
            style: TextStyle(
              color: Color(0xFF2F3C2F),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}