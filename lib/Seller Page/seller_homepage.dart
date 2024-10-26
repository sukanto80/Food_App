import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/Seller%20Page/all_product_show.dart';
import 'package:home_kitchen/Seller%20Page/upload_product_form.dart';

import 'SellerDrawerWidget.dart';
import 'order_page.dart';

class SellerHomepage extends StatefulWidget {
  const SellerHomepage({super.key});



  @override
  State<SellerHomepage> createState() => _SellerHomepageState();
}


class _SellerHomepageState extends State<SellerHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earn with Home Kitchen', style: TextStyle(color: Colors.white, fontSize: 18),),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextFormField(


              decoration: InputDecoration(
                hintText: 'Search here....',
                hintStyle: const TextStyle(color: Colors.red ),
                prefixIcon: const Icon(Icons.search, size: 25,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 36),
            Center(
              child: SizedBox(
                width: 250, // Set the desired width
                height: 100, // Set the desired height
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=>UploadPage());
                   // Navigator.pushNamed(context, 'upload_product_form');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle, color: Colors.white, size: 48),
                      SizedBox(width: 8),
                      Text(
                        'Upload Your Product',
                        style: TextStyle(fontSize: 18, color: Colors.white ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(FoodItemsScreen());
                  },
                  child: _buildGridItem(
                    icon: Icons.shopping_bag,
                    label: 'All Product',
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  FoodItemsScreen()),
                    );
                  },
                  child: _buildGridItem(
                    icon: Icons.attach_money,
                    label: 'Total Sales',
                  ),
                ),
                _buildGridItem(
                  icon: Icons.account_balance_wallet,
                  label: 'Order',
                ),
                _buildGridItem(
                  icon: Icons.bar_chart,
                  label: 'Sales Summary',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard ,),
            label: 'At a Glance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Financial Status',
          ),
        ],
      ),
      drawer : SellerDrawerWidget(),
    );
  }


  Widget _buildGridItem({required IconData icon, required String label}) {
    return ElevatedButton(
      onPressed: () {

        if(label=='All Product'){
          Get.to(()=>FoodItemsScreen());
        }else if(label== 'Order'){
          //Get.to(()=>OrdersPage());
        }

      },
      style: ElevatedButton.styleFrom(backgroundColor:
      Colors.white,


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 68, color: Colors.red),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
