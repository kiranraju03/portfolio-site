import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';

class CarouselSection extends StatelessWidget {
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? 0.5 : .6);
    return Container(
      color: Colors.green,
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          viewportFraction: 1,
          scrollPhysics: NeverScrollableScrollPhysics(),
          height: carouselContainerHeight,
        ),
        items: [],
      ),
    );
  }
}
