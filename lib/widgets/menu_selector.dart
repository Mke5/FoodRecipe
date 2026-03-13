import 'package:flutter/material.dart';
import 'package:foodrecipe/models/recipe_models.dart';

class MenuSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const MenuSelector({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuItems.length,

        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: index == menuItems.length - 1 ? 20 : 0,
            ),

            child: GestureDetector(
              onTap: () => onTap(index),

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: LinearGradient(
                    colors: [
                      isSelected ? Colors.green : Colors.white,
                      isSelected ? Colors.greenAccent : Colors.white,
                    ],
                  ),
                ),

                child: Text(
                  menuItems[index],

                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
