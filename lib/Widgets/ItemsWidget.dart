import 'package:flutter/material.dart';


class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.76,
      children: [
        // for(int i=1; i<5; i++)
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10) ,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent, //need to fix
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "singleItemPage");
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "images/Beef Biryani.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Beef Biryani",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],),
        ),


//item 2


        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10) ,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent, //need to fix
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "singleItemPage");
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "images/Chicken Biryani.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chicken Biryani",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),








          ],),
        ),
        // item 3


        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10) ,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent, //need to fix
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "singleItemPage");
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "images/Beef Tehari.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Beef Tehari",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),




          ],),
        ),


        //item 4
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10) ,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent, //need to fix
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "singleItemPage");
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "images/Chicken Roast Polaw.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chicken Roast Polaw",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
          ),
        ),
      ],
    );
  }
}