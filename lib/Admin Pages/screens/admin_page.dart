import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/Admin%20Pages/screens/seller_all_product.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Session/session.dart';
import '../../pages/register_home.dart';
import '../providers/restaurant_provider.dart';
import '../providers/menu_item_provider.dart';
import '../providers/order_provider.dart';
import '../providers/user_provider.dart';
import '../models/restaurant.dart';
import '../models/menu_item.dart';
import '../models/order.dart';
import '../models/user.dart';
import 'approved_food_item.dart';

class admin_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: ListView(
        children: [
         // ListTile(

            ElevatedButton(

              onPressed: () {
               /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageRestaurants()),
                );*/
                Get.to(()=>UnapprovedFoodItemsScreen());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
              child: Text(
                "Manage Food List",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
            ElevatedButton(

            onPressed: () {
              /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageRestaurants()),
                );*/
              Get.to(()=>ApprovedFoodItemsScreen());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            child: Text(
              "Approved Products List",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),
          ),

           ElevatedButton(

           onPressed: () {
              Navigator.push(
               context,
                   MaterialPageRoute(builder: (context) => ManageMenuItems()),
                  );
           },
           style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all(Colors.orange),
           ),
           child: Text(
           "Manage Menu Items",
           style: TextStyle(
           color: Colors.black,
           fontSize: 20,
           fontWeight: FontWeight.bold,
           ),
           ),
           ),

          ElevatedButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewOrders()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            child: Text(
              "View Orders",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          ElevatedButton(

             onPressed: () {
                  Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => ManageUsers()),
                    );
                   },
                 style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(Colors.orange),
                   ),
                child: Text(
                    "Manage Users",
                       style: TextStyle(
                        color: Colors.black,
                           fontSize: 20,
                    fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
          ElevatedButton(

            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(MyPrefs.sellerId);
              prefs.remove(MyPrefs.IsSetup);
              prefs.remove(MyPrefs.userType);


              Get.offAll(RegisterHome());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
    ),


    );

  }
}

class ManageRestaurants extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _description;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newRestaurant = Restaurant(
        id: DateTime.now().toString(),
        name: _name!,
        description: _description!,
      );
      Provider.of<RestaurantProvider>(context, listen: false).addRestaurant(newRestaurant);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Restaurants'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Restaurant Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _submit(context),
                    child: Text('Add Restaurant'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<RestaurantProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = provider.restaurants[index];
                      return ListTile(
                        title: Text(restaurant.name),
                        subtitle: Text(restaurant.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Implement edit functionality here
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                provider.deleteRestaurant(restaurant.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageMenuItems extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  double? _price;
  String _restaurantId = '';

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newMenuItem = MenuItem(
        id: DateTime.now().toString(),
        restaurantId: _restaurantId,
        name: _name!,
        price: _price!,
      );
      Provider.of<MenuItemProvider>(context, listen: false).addMenuItem(newMenuItem);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    _restaurantId = restaurantProvider.restaurants.isNotEmpty
        ? restaurantProvider.restaurants[0].id
        : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Menu Items'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: _restaurantId,
              items: restaurantProvider.restaurants.map((restaurant) {
                return DropdownMenuItem(
                  value: restaurant.id,
                  child: Text(restaurant.name),
                );
              }).toList(),
              onChanged: (value) {
                _restaurantId = value.toString();
              },
              decoration: InputDecoration(labelText: 'Select Restaurant'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Menu Item Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Price'),
                    validator: (value) {
                      if (value!.isEmpty || double.tryParse(value) == null) {
                        return 'Please enter a valid price';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _price = double.parse(value!);
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _submit(context),
                    child: Text('Add Menu Item'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<MenuItemProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.menuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = provider.menuItems[index];
                      return ListTile(
                        title: Text(menuItem.name),
                        subtitle: Text('\Tk ${menuItem.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Implement edit functionality here
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                provider.deleteMenuItem(menuItem.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Orders'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.orders.length,
            itemBuilder: (context, index) {
              final order = provider.orders[index];
              return ListTile(
                title: Text('Order ID: ${order.id}'),
                subtitle: Text('User ID: ${order.userId}'),
                trailing: Text('Date: ${order.date.toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}

class ManageUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              final user = provider.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    provider.deleteUser(user.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
