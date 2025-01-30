import 'package:erp_system/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'add_student.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Edit page',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: bgcolor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? xFile =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                studentlist[listindex]['image'] = await xFile!.readAsBytes();
                setState(() {});
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: bgcolor,
                  shape: BoxShape.circle,
                  border: Border.all(color: black),
                  image: DecorationImage(
                    image: studentlist[listindex]['image'] == null
                        ? NetworkImage(img)
                        : MemoryImage(studentlist[listindex]['image']),
                  ),
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
                  'image': studentlist[listindex]['image'],
                };
                studentlist[listindex] = ram;
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 390,
                color: primary,
                child: Text(
                  'Update Student',
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
