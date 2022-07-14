import 'package:admin_panel/Api/registervender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateVenderScreen extends StatefulWidget {
  const CreateVenderScreen({Key? key}) : super(key: key);

  @override
  State<CreateVenderScreen> createState() => _CreateVenderScreenState();
}

class _CreateVenderScreenState extends State<CreateVenderScreen> {
  bool _obscureText = true;

  bool _loading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  clear() {
    _emailController.text = "";
    _passwordController.text = "";
    _nameController.text = "";
    _phoneController.text = "";

    _confirmPasswordController.text = "";
    setState(() {
      _loading = false;
    });
  }

  showDialog(
    String title,
    var message,
  ) {
    Get.defaultDialog(
        title: title,
        middleText: message.toString(),
        backgroundColor: Theme.of(context).primaryColor,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
        radius: 30);
  }

  _signup(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    setState(() {
      _loading = true;
    });
    await RegisterVender.signup(email, password, name, phone).then((value) {
      if (value == "Registration Successful!") {
        clear();
        showDialog(
          "Created",
          value,
        );
      } else if (value == "Document upload Pending") {
        showDialog(
          "Error",
          "$value Upload It First",
        );
        clear();
      } else {
        showDialog(
          "Error",
          value,
        );
      }
    });
  }

  _passwordtoggle() {
    setState(() {
      _obscureText ? _obscureText = false : _obscureText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    'Register Vender',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),

                  //TextField Email

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.libreFranklin(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(22, 33, 149, 243),
                            hintText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                              size: 35,
                              color: Colors.blueAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        //TextField Password
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.libreFranklin(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        TextField(
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            suffixIcon: _obscureText
                                ? IconButton(
                                    onPressed: (() => _passwordtoggle()),
                                    icon: const Icon(
                                      Icons.visibility_off_rounded,
                                      size: 35,
                                      color: Colors.blueAccent,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: (() => _passwordtoggle()),
                                    icon: const Icon(Icons.visibility_rounded,
                                        size: 35, color: Colors.blueAccent),
                                  ),
                            fillColor: const Color.fromARGB(22, 33, 149, 243),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Confirm Password",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.libreFranklin(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        TextField(
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: 'Comfirm Password',
                            filled: true,
                            suffixIcon: _obscureText
                                ? IconButton(
                                    onPressed: (() => _passwordtoggle()),
                                    icon: const Icon(
                                      Icons.visibility_off_rounded,
                                      size: 35,
                                      color: Colors.blueAccent,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: (() => _passwordtoggle()),
                                    icon: const Icon(Icons.visibility_rounded,
                                        size: 35, color: Colors.blueAccent),
                                  ),
                            fillColor: const Color.fromARGB(22, 33, 149, 243),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //TextField Name
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Name",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.libreFranklin(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.name,
                          controller: _nameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(22, 33, 149, 243),
                            hintText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //TextField Phone
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Phone",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.libreFranklin(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: _phoneController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(22, 33, 149, 243),
                            hintText: 'Phone',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.lightBlueAccent,
                                elevation: 5,
                              ),
                              onPressed: () => (_passwordController.text ==
                                      _confirmPasswordController.text)
                                  ? _signup(
                                      _emailController.text,
                                      _passwordController.text,
                                      _nameController.text,
                                      _phoneController.text,
                                    )
                                  : showDialog(
                                      "Error",
                                      "Password and Confirm Password does not match",
                                    ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Register Venders",
                                  style: GoogleFonts.libreFranklin(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
