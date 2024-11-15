import 'package:flutter/material.dart';
import 'package:top_20_movies/services/auth_service.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  static const id = '/login';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  //late AppLinks _appLinks;
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  // Controllers for username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/icon/logo_512.png',
                  height: 160,
                ), // You can replace this with your app's logo
                SizedBox(height: 10),
                Text(
                  'Top 20 Movies',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Login to your TMDB account',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 50),

                // Login Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Username Field
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await AuthService().logInUsernamePassword(
                                  _usernameController.text,
                                  _passwordController.text);
                              Navigator.pushReplacementNamed(
                                context,
                                '/',
                              );
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                // Or Divider
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20),

                // TMDB Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      try {
                        await AuthService.deepLink(
                          onFinish: () => Navigator.pushReplacementNamed(
                            context,
                            '/',
                          ),
                        ).logInWebPage();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString())));
                      }
                    },
                    icon: Image.asset(
                      'assets/icon/TMDP_square_1.png',
                      height: 22,
                    ),
                    label: Text(
                      'Log in / sign up with TMDB website',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Continue as a guest
                TextButton(
                  onPressed: () async {
                    await AuthService().createGuestSession();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text('Continue as a guest'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
