import 'package:erp_system/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: bgcolor,
            )),
        title: Text(
          'Add Student',
          style: TextStyle(
              color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async{
                ImagePicker imagePicker = ImagePicker();
                XFile? xFile = await imagePicker.pickImage(
                    source: ImageSource.gallery);
                photo = await xFile!.readAsBytes();
                setState(() {

                });
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: bgcolor,
                  shape: BoxShape.circle,
                  border: Border.all(color: black),
                  image: DecorationImage(
                    image: photo == null ? NetworkImage(img) : MemoryImage(
                        photo!),),
                ),
              ),
            ),
            textbox(label: 'ID', txtController: textID),
            textbox(label: 'Name', txtController: textName),
            textbox(label: 'Age', txtController: textage),
            textbox(label: 'Course', txtController: textcourse),
            textbox(label: 'Phone', txtController: textphone),
            textbox(label: 'Address', txtController: textaddress),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                Map ram = {
                  'id': textID.text,
                  'name': textName.text,
                  'age': textage.text,
                  'course': textcourse.text,
                  'phone': textphone.text,
                  'address': textaddress.text,
                  'image':photo,
                };
                studentlist.add(ram);
                Navigator.of(context).pushReplacementNamed('/');
                photo=null;
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 390,
                color: primary,
                child: Text(
                  'Add Student',
                  style: TextStyle(
                      color: bgcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textbox(
    {required String label, required TextEditingController txtController}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: txtController,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
      ),
    ),
  );
}
