import 'package:flutter/material.dart';


class Item6Widget extends StatelessWidget {
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
                  "images/Plain Rice.jpg",
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
                  "Plain Rice",
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
                  "images/Plain Polaw.jpg",
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
                  "Plain Polaw",
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
                  "images/Bhuna Khichuri.jpg",
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
                  "Bhuna Khichuri",
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
                  "images/Khuder Bhaat.jpg",
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
                  "Khuder Bhaat",
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
