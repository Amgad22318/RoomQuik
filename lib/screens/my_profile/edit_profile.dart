import 'package:flutter/material.dart';

import '../../widgets/default_text_form_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var namecontroller = TextEditingController();
    var emailcontroller = TextEditingController();
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
                leading: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                title:
                    Column(
                      children: [
                        DefaultTextFormField(
                          label: 'Name',

                          controllerr: emailcontroller,
                          type: TextInputType.text,
                          radius: 0,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          fontweight: FontWeight.bold,
                          fonts: 30,
                          focusedborder: InputBorder.none,
                          enabledbprder: InputBorder.none,
                          erroborder: InputBorder.none,
                          disabledborder: InputBorder.none,
                          readonly: false,
                          max: 0,
                          vertical: 0,
                          ispassword: false,
                        ),
                        Container(height: 1,
                        color: Colors.black,),
                      ],
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 21.0),
                  child: Icon(
                    Icons.email,
                    size: 40,
                  ),
                ),
                title:
                    Column(
                      children: [
                        DefaultTextFormField(
                          label: 'E-mail',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          vertical: 0,
                          controllerr: namecontroller,
                          type: TextInputType.text,
                          radius: 0,
                          fontweight: FontWeight.bold,
                          fonts: 30,
                          readonly: false,
                          focusedborder: InputBorder.none,
                          enabledbprder: InputBorder.none,
                          erroborder: InputBorder.none,
                          disabledborder: InputBorder.none,
                          max: 0,
                          ispassword: false,
                        ),
                        Container(height: 1,
                          color: Colors.black,),
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
