import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final globalKey = GlobalKey<FormState>();
  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Form Input", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your username";
                              }
                              return null;
                            },
                            controller: _UsernameController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
          
                              bool emailValid = RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                              ).hasMatch(value);
          
                              if (!emailValid) {
                                return "Invalid email format";
                              }
          
                              return null;
                            },
                            controller: _EmailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your phone number";
                              }
          
                              final regex = RegExp(r'^(70|71|73|77|78)\d{7}$');
          
                              if (!regex.hasMatch(value!.trim())) {
                                return "Invalid phone number format";
                              }
          
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "phone",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
          
                              final regex = RegExp(r'^.{6,}$');
          
                              if (!regex.hasMatch(value)) {
                                return "Password must be at least 6 characters";
                              }
          
                              return null;
                            },
          
                            controller: _PasswordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                           GestureDetector(
                            onTap: () {
                              if (globalKey.currentState!.validate()) {
                              
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Processing Data"),
                                  ),
                                );
                              }
                            },
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 50  ,
                        child:  Center(child: Text("إرسال",style: TextStyle(color: Colors.white,fontSize: 22),)),
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                )
              
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
