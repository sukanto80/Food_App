import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'Controller/upload_product_controller.dart';


class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}


class _UploadPageState extends State<UploadPage> {

  final controller = Get.put(UploadProductController());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  XFile? _image;
  File? ima;
  Uint8List? file;
  String folderPath='';
  Map<String, dynamic>? selectedItem;
  Future<void> getImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      var pickedImage = image;
      final pickedImageforshow = File(image.path);
      Uint8List imageData = await image.readAsBytes();

       setState(() {
         _image = pickedImage;
         file =  imageData;
         ima = pickedImageforshow;
         folderPath = 'images/${image.name}';
       });


    } catch (e) {
      print('Error picking image: $e');
    }
  }
  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload your item', style: TextStyle(color: Colors.white, fontSize: 22),),
        backgroundColor: Colors.red,
      ),
      body: Obx((){
        return  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child:  controller.isLoading.value?Center(child: CircularProgressIndicator(),): ListView(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<Map<String, dynamic>>(
                          //value: selectedItem,  // Selected value (can be null for no default)
                          decoration: InputDecoration(
                            labelText: "Select your category",
                            border: OutlineInputBorder(),),

                          items: controller.allCategory.map((item) {
                            return DropdownMenuItem<Map<String, dynamic>>(
                              value: item,  // The value is the whole map
                              child: Text(item['name']),  // Display the name
                            );
                          }).toList(),
                          onChanged: (Map<String, dynamic>? newValue) {
                            setState(() {
                              controller.categoryId.value = newValue!['categoryId'];
                              print(controller.categoryId.value);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a category';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      errorText: nameController.text.isEmpty ? "Textfield can't be empty!" : null,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Textfield can't be empty!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ima==null ?GestureDetector(
                    onTap: () {
                      getImage();
                      // Handle image/video upload
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add, size: 50, color: Colors.grey),
                            Text('Add Photo of your food', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ):Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.file(ima!,fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Food Description',
                      errorText: descriptionController.text.isEmpty ? "Textfield can't be empty!" : null,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Textfield can't be empty!";
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      errorText: priceController.text.isEmpty ? "Textfield can't be empty!" : null,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Textfield can't be empty!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),


                  ElevatedButton(onPressed: (){
                    // Navigator.pushNamed(context, 'all_food_item');
                    //Navigator.pushNamed(context, 'product_list');
                    if (formKey.currentState!.validate()) {

                      controller.addCategoryAndFoodItem(nameController.text.toString(),
                          descriptionController.text.toString(),
                          priceController.text.toString(),ima!,folderPath);

                      // Process data
                    }
                  },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange) ,


                    child: Text('Upload', style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.normal, color: Colors.white
                    ),),


                  )
                ],
              ),
            )

        );

      }

      ),
    );
  }
}
