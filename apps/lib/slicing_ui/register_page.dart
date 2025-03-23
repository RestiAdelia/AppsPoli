import 'package:apps/slicing_ui/input_validasi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apps/slicing_ui/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Form key untuk validasi
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        birthDateController.text = DateFormat("dd-MM-yyyy").format(pickedDate);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Navigasi ke halaman ProfilePage dengan data yang diinput
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            birthDate: birthDateController.text,
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffF5CB58),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "New Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.all(24),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name
                       Text("Full name", style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: nameController,
                        decoration: _inputDecoration("Enter your full name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required!";
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 16),

                      // Email
                       Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: _inputDecoration("example@example.com"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required!";
                          }
                          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return "Enter a valid email!";
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 16),

                      // Password
                       Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: _inputDecoration("************").copyWith(
                          suffixIcon: const Icon(Icons.visibility_off, color: Colors.orange),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required!";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters!";
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 16),

                      // Mobile Number
                       Text("Mobile Number", style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: _inputDecoration("+ 123 456 789"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone number is required!";
                          }
                          if (!RegExp(r"^\+?\d{10,13}$").hasMatch(value)) {
                            return "Enter a valid phone number!";
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 16),

                      // Date of Birth
                       Text("Date of Birth", style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 8),
                      TextFormField(
                        controller: birthDateController,
                        readOnly: true,
                        decoration: _inputDecoration("DD / MM / YYYY").copyWith(
                          suffixIcon: IconButton(
                            icon:  Icon(Icons.calendar_today, color: Colors.orange),
                            onPressed: selectDate,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Date of birth is required!";
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 16),

                      // Terms and Privacy
                       Center(
                        child: Text(
                          "By continuing, you agree to\nTerms of Use and Privacy Policy.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                       SizedBox(height: 16),

                      // Button Sign Up
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffE95322),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: _submitForm,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Already have an account?

                      Center(child: Text("or sign up with")),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset("gambar/Google.png", width: 40),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset("gambar/Facebook.png", width: 40),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset("gambar/Fingerprint.png", width: 40),
                          ),
                          SizedBox(height: 12),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: const Text("Log in", style: TextStyle(color: Colors.orange)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xFFFFF2CC),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
