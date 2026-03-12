import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodrecipe/constants/constants.dart';

class RecipeOnboardingScreen extends StatefulWidget {
  const RecipeOnboardingScreen({super.key});
  @override
  State<RecipeOnboardingScreen> createState() => _RecipeOnboardingScreenState();
}

class _RecipeOnboardingScreenState extends State<RecipeOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: size.height * 0.625,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade400,
                  Colors.grey.shade200,
                  Colors.white,
                ],
              ), // LinearGradient
              image: DecorationImage(
                image: AssetImage("assets/food-recipe/background_1.png"),
                fit: BoxFit.cover,
              ), // DecorationImage
            ), // BoxDecoration
          ), // Container
          SizedBox(height: 20),
          Container(
            height: size.height * 0.325,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Let's cook your own food and adjust your diet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ), // Text
                  Text(
                    "Don't be confused, Complete your nutriional needs by choosing the right recipes and ingredients",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      height: 1.8,
                    ),
                  ), // Text
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: gradientColor,
                      ), // BoxDecoration
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ), // TextStyle
                        ),
                      ), // Center
                    ), // Container
                  ),
                ],
              ), // Column
            ),
          ), // Container
        ],
      ), // Column
    ); // Scaffold
  }
}
