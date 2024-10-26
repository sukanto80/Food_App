import 'Package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  String id,name,image;


  CategoriesWidget({
    required this.id, required this.name,required this.image
  });

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Image.network(
              widget.image ,fit: BoxFit.cover,
                  height: 70 ,
                  width: 70,

            ),
          ),
        ),
        Text(widget.name)
      ],
    );
  }
}
