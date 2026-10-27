import 'package:coding_game/backendService/auth/sign_in.dart';
import 'package:coding_game/model/auth/sign_in.dart';
import 'package:coding_game/viewModel/auth/sign_in.dart';
import 'package:coding_game/views/reusables/snackbar.dart';
import 'package:coding_game/views/home/home_image_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<SingnInProvider>().isLoading;
    SingnInProvider signInProvider = context.read<SingnInProvider>();
    return Scaffold(
      body: HomeImagePage(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JetBrainsMono',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Provide the details below',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontFamily: 'JetBrainsMono',
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Email
                    _showTextField(
                      hint: 'Enter your email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 14),

                    // Password
                    _showTextField(
                      hint: 'Enter your password',
                      controller: _passwordController,
                      obscureText: true,
                    ),

                    const SizedBox(height: 28),

                    // GO button
                    GestureDetector(
                      onTap: isLoading
                          ? null
                          : () async {
                              await signInProvider.signInUser(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );

                              String? error = signInProvider.errorMessage;
                              SignInModel? user = signInProvider.user;

                              if (!context.mounted) {
                                return;
                              }
                              if (error != null) {
                                showErrorOrSuccess(
                                  message: signInProvider.errorMessage!,
                                  backgroundColor: Colors.red,
                                  icon: Icons.error,
                                  iconColor: Colors.white,
                                  context: context,
                                );
                              } else if (user != null) {
                                showErrorOrSuccess(
                                  message:
                                      'Welcome ${signInProvider.user?.playerName}',
                                  backgroundColor: Colors.green,
                                  iconColor: Colors.white,
                                  icon: Icons.check_circle,
                                  context: context,
                                );
                              }
                            },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: !isLoading
                            ? Image.asset(
                                'assets/images/go.png',
                                fit: BoxFit.contain,
                              )
                            : Text(
                                'Signing you in...',
                                style: TextStyle(
                                  fontFamily: 'JetBrainsMono',
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // OR divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontFamily: 'JetBrainsMono',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Google button
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFF272822),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.10),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(22),
                        child: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showTextField({
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'JetBrainsMono',
        fontSize: 14,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontFamily: 'JetBrainsMono',
          fontSize: 14,
        ),
        filled: true,
        fillColor: const Color(0xFF272822),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 17,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.08),
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
