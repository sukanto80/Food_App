import 'Package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
       child: Container(
         padding: EdgeInsets.symmetric(horizontal: 15) ,
         height: 90,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [

                 Text(
                   "Total:",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 SizedBox(
                   width:15,
                 ),
                 Text(
                   "530 tk",
                   style: TextStyle(
                     fontSize: 19,
                     fontWeight: FontWeight.bold,
                     color: Colors.red,
                   ),

                 ),

               ],
             ),
             ElevatedButton(

                 onPressed: () {
                   Navigator.pushNamed(context,'payment');

                 },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
               child: Text(
                   "Order Now",
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),

               ),
                 ),

           ],
         ),


       ),

    );
  }
}
