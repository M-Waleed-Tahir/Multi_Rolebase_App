import 'package:flutter/material.dart';
import 'package:multi_role_base_app/admin_screen.dart';
import 'package:multi_role_base_app/home_screen.dart';
import 'package:multi_role_base_app/student_screen.dart';
import 'package:multi_role_base_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ageController = TextEditingController();
  final userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'SignUp',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      hintText: 'Age',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.laptop_windows_outlined),
                      hintText: 'User',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextFormField(
                    controller: passController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 74,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: InkWell(
                  autofocus: true,
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();

                    sp.setString('email', emailController.text.toString());
                    sp.setString('age', ageController.text.toString());

                    // admin , student , teacher
                    sp.setString('userType', userController.text.toString());

                    sp.setBool('isLogin', true);
                    if (sp.getString('userType') == 'Student') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentScreen(),
                          ));
                    } else if (sp.getString('userType') == 'Teacher') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherScreen(),
                          ));
                    }
                    else if (sp.getString('userType') == 'Admin') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminScreen(),
                          ));
                    }
                    else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(21)),
                      height: 40,
                      width: double.infinity,
                      child: const Center(
                          child: Text(
                        'SignUp',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
