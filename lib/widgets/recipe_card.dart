import 'package:flutter/material.dart';
import 'package:foodrecipe/models/recipe_models.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final int index;

  const RecipeCard({super.key, required this.recipe, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 10),

      child: Container(
        width: MediaQuery.of(context).size.width / 2.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          image: DecorationImage(
            image: AssetImage(recipe.image),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: recipe.fav ? Colors.red : Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          recipe.name,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          const Icon(Icons.star, size: 18, color: Colors.amber),
                          Text(
                            "${recipe.rate}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "1 Bowl (${recipe.weight}g)",
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "${recipe.calorie} Kcal",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
