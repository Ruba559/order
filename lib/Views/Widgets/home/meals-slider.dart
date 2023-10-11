import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MealsSlider extends StatelessWidget {
  const MealsSlider({super.key, this.height, required this.widgets});


  final double? height;
  final List<Widget> widgets ;

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider.builder(
      itemCount: widgets.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
         autoPlayAnimationDuration: Duration(milliseconds: 900),
            autoPlayCurve: Curves.linear,
        reverse: true,
        aspectRatio: 5.5,
        viewportFraction: 0.62,
      ),
      itemBuilder: (context, index, id) {
        return widgets[index];
      },
    );
  }
}