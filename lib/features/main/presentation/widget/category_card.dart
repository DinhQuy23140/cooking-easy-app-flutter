
import 'package:flutter/material.dart';

import '../../domain/model/category.dart';

class CategoryCard extends StatelessWidget{
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
        ),
        color: Colors.white,
        elevation: 2,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: Color(0xFFF5F5F5)),
                color: Color(0xFFF5F5F5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  category.strCategoryThumb,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child;
                    }
                    return CircularProgressIndicator(
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!
                          : null,
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: Text(
                category.strCategory,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1E2F23),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sans-serif',
                  letterSpacing: 1,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

}