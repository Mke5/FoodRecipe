import 'package:flutter/material.dart';
import 'package:foodrecipe/constants/constants.dart';
import 'package:foodrecipe/views/home_screen_recipe.dart';

class RecipeOnboardingScreen extends StatefulWidget {
  const RecipeOnboardingScreen({super.key});

  @override
  State<RecipeOnboardingScreen> createState() => _RecipeOnboardingScreenState();
}

class _RecipeOnboardingScreenState extends State<RecipeOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top container with gradient + image
          Container(
            height: size.height * 0.625,
            decoration: BoxDecoration(
              gradient: gradientGrey, // from constants.dart
              image: const DecorationImage(
                image: AssetImage("assets/food-recipe/background_1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Bottom content
          SizedBox(
            height: size.height * 0.325,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Let's cook your own food and adjust your diet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),

                  const Text(
                    "Don't be confused, complete your nutritional needs by choosing the right recipes and ingredients",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      height: 1.8,
                    ),
                  ),

                  // Get Started button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreenRecipe(),
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: gradientGreen,
                      ),
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
