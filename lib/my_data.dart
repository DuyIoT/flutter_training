import 'dart:math';

import 'package:flutter/material.dart';

class Category {
  String name;
  List<SubCategory> subCategories;
  bool isSelected;

  Category({this.name, this.subCategories, this.isSelected});

  static List<Category> get generateCategories {
    return List.generate(4, (index) {
      return Category(
        name: "${nameCategories[index]}",
        subCategories: SubCategory.generateSubCategories,
        isSelected: index == 0 ? true : false
      );
    });
  }
}

class SubCategory {
  String name;
  int numberDoctor;
  String imagePath;
  Color color;

  SubCategory({this.name, this.numberDoctor, this.imagePath, this.color});

  static List<SubCategory> get generateSubCategories {
    return List.generate(10, (index) {
      int subNameIndex = Random().nextInt(2);
      int numberOfDoctor = Random().nextInt(50) + 1;
      int imageIndex = Random().nextInt(2);
      int bgColorIndex = Random().nextInt(2);
      return SubCategory(
        name: nameSubCategories[subNameIndex],
        numberDoctor: numberOfDoctor,
        imagePath: imageSubCategories[imageIndex],
        color: colors[bgColorIndex]
      );
    });
  }
}

final nameCategories = ["Adults", "Childrens", "Womens", "Mens"];
final nameSubCategories = ["Cough & Cold", "Heart Specialist"];

final imageSubCategories = ['assets/images/heart-specialist.png', 'assets/images/doctor.png'];
final colors = [Colors.redAccent, Colors.orangeAccent];
