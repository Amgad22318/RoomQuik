import 'package:flutter/material.dart';

import '../../widgets/default_text_form_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Edit Profile'),
              SizedBox(
                height: 10,
              ),
              Center(
                child: CircleAvatar(
                  radius: 90,
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 105.0, top: 90),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                )),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    DefaultTextFormField(
                      label: '',
                      controllerr: namecontroller,
                      type: TextInputType.text,
                      radius: 0,
                      fontweight: FontWeight.bold,
                      fonts: 30,
                      readonly: false,
                      max: 0,
                      ispassword: false,
                    ),

                    Container(
                      color: Colors.black,
                      height: 1,
                    )
                  ],
                ),

              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.email,
                      size: 40,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail'),
                    DefaultTextFormField(
                      label: '',
                      controllerr: namecontroller,
                      type: TextInputType.text,
                      radius: 0,
                      fontweight: FontWeight.bold,
                      fonts: 50,
                      readonly: false,
                      max: 0,
                      ispassword: false,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.black,
                      height: 1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
