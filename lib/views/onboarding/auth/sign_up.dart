import 'package:coding_game/viewModel/auth/sign_up_provider.dart';
import 'package:coding_game/views/reusables/snackbar.dart';
import 'package:coding_game/views/home/home_image_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _playerNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUpProvider = context.read<SignUpProvider>();
    final bool isLoading = context.watch<SignUpProvider>().isLoading;

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
                      'SIGN UP',
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

                    // Player name
                    _showTextField(
                      hint: 'Enter player name',
                      controller: _playerNameController,
                    ),

                    const SizedBox(height: 14),

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
                              await signUpProvider.signUpUser(
                                playerName: _playerNameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );

                              if (!context.mounted) {
                                return;
                              }
                              //show success or error
                              if (signUpProvider.errorMessage != null) {
                                //show error message
                                showErrorOrSuccess(
                                  message: signUpProvider.errorMessage!,
                                  backgroundColor: Colors.red,
                                  iconColor: Colors.white,
                                  icon: Icons.error,
                                  context: context,
                                );
                              } else if (signUpProvider.user != null) {
                                //show success
                                final playerName =
                                    signUpProvider.user?.playerName;

                                showErrorOrSuccess(
                                  message: 'Welcome $playerName',
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
                                'Signing you up...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JetBrainsMono',
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

  //show signup status
  void _showErrorOrSuccess({required String message, required Color color}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
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
