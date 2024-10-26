import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  // User info (These should be pre-populated with current user info from Firestore)
  String _name = 'John Doe';
  String _phone = '017xxxxxx51';
  String _location = 'A DB, Z city';
  String _email = 'user@gmail.com';

  File? _image; // Holds the selected image
  final ImagePicker _picker = ImagePicker();

  // Function to select image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // Function to save the updated profile information
  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Update Firebase with new information and photo

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Profile image section
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('images/avater.png') as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.camera_alt, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Name input
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _name = newValue!;
                },
              ),
              const SizedBox(height: 20),

              // Phone input
              TextFormField(
                initialValue: _phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _phone = newValue!;
                },
              ),
              const SizedBox(height: 20),

              // Location input
              TextFormField(
                initialValue: _location,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _location = newValue!;
                },
              ),
              const SizedBox(height: 20),

              // Email input (non-editable in many cases)
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
                enabled: false, // Email is typically non-editable
              ),
              const SizedBox(height: 40),

              // Save button
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

