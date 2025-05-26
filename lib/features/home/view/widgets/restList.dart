import 'package:day1ui/features/home/view/widgets/restItem.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/restaurantsModel.dart';



class RestListWidget extends StatelessWidget {
  RestListWidget({super.key});
  final List<RestaurantsModel> restaurants = [
    RestaurantsModel(
      image: "https://s3-alpha-sig.figma.com/img/3d9a/e04c/ac9c51e3011ba16c2c4085c89b38c6c2?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=gfyL1if5Hl4o0dgS3TmF3TW0DK8f2qwIP0zy7AE~dwGnBJflVHPFBMRyLsiFgZtrp90sFF~z~nXTPqPrU6m4orcku-vs4M2QouqaTR5TT0UbijKYYZzNefabnav4MDQIjatrCauz7uQSIWUo9OYSc0s3uAgnqNvYBOFxVbh-6O4VHtFZJb83YzF7X-eOoGtjBkpJEV4kP~On2ZS7zBaGBpwAsNu9oFL5NqBUUsXpbk9KE50LBJUjJtrPctwh1IviUZRMcTm3-61rBB2sOj6bVyWv~gPw4apdwq1egwmxbRuXIQy7kKvq5y-RodelK2KWfAIuvyKya5owPvnM3J5pPA__",
      categoryName: "Burger King",
      price: 10,
      description: "",
      color: Color(0xffFF6B57),
      delevery: "Free",
      rating: 4.2,
      distance: "10",
      time: "30",
      name: "Restaurant1",

    ),
    RestaurantsModel(
      image:'https://s3-alpha-sig.figma.com/img/c859/8c90/d3233507039b3181948faebbae72f1d6?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=nSkrHMsiwv20jaoyh6fExrXH9G3eNBkfrcm6OXKD3-kdmd1k~qlVIAvQHo~aI~5ld7h1CbQVa5zK4gv~~jX8M8qxc1VcaDyJx1maPFK9nN1csgfs7hzWWJWKHik92tKVfopmson8Fho~zRO14skEEsSlH3vBe5YMUh~6z8-1ifWVpG5F3zGpfqbFZ~NOa85V7fWQMnMLrw2ci1s32zFKnPiWwCljnScOXO30BENwurT4vQpAAisL4-Y2ebLqpyMPeQOAaiJqmLXb95j4mG7wNQtYcnOT-WZur1p~Oh6uh9T0mxukegBt6oJNdU8gZ4vt2BqZe6dWq2B2p9NIe8JOJg__',
      categoryName: "Pizza Hut",
      price: 10,
      description: "",
      color: Colors.greenAccent,
      delevery: "Free",
      rating: 3.2,
      distance: "10",
      time: "50",
      name: "Restaurant2",

    ),




  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 330,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          itemCount: restaurants.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return RestItemWidget(restaurant: restaurants[index],);
          }),
    );
  }



}