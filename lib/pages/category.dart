import 'package:flutter/material.dart';


import '../Widgets/DrawerWidget.dart';
import '../Widgets/Item2Widget.dart';
import '../Widgets/Item3Widget.dart';
import '../Widgets/Item4Widget.dart';
import '../Widgets/Item5Widget.dart';
import '../Widgets/Item6Widget.dart';
import '../Widgets/ItemsWidget.dart';

class category extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 6,//there will be 6 tabs
      child: Scaffold(

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top:25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, 'cat_drawer');
                        },
                        child: Icon(Icons.sort_rounded,
                          color: Colors.red,
                          size:35,
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.search,
                          color: Colors.red,
                          size:35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Cuisines",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Delivers on Time",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TabBar(
                  isScrollable: true,
                  //indicator: BoxDecoration(),
                  labelStyle: TextStyle(fontSize: 20),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: "Biryani"),
                    Tab(text: "Khichuri"),
                    Tab(text: "Bhorta & Vegitables"),
                    Tab(text: "Fish Items"),
                    Tab(text: "Meat Items"),
                    Tab(text: "Rice"),
                  ],
                ),
                Flexible(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        ItemsWidget(),
                        Item2Widget(),//Container(color: Colors.red),
                        Item3Widget(), //Container(color: Colors.red),
                        Item4Widget(),
                        Item5Widget(),
                        Item6Widget(),
                      ],
                    )),
              ],
            ),
          ),
        ),
       //   drawer : DrawerWidget()
      ),
    );
  }
}
