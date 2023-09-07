import 'package:clean_architecture_flutter/features/auth/presenter/widgets/social_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.network(
                      "https://refactoring.guru/images/content-public/logos/logo-new.png?id=97d554614702483f31e38b32e82d8e34",
                      width: 300,
                      height: 300,
                      cacheHeight: 400,
                      cacheWidth: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Flexible(
                    child: Text(
                      "Clean Architecture",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width > 460
                    ? 460
                    : MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    const TextField(
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 32.0,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Icon(Icons.email),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 5.0,
                      ),
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 32.0,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Icon(Icons.lock),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Icon(Icons.visibility_off),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width > 460
                  ? 460
                  : MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24,
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign in by ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const SocialButton(
                    iconSource: "lib/core/resources/vector/facebook.svg",
                    title: "Facebook",
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width > 460 ? 24 : 12,
                  ),
                  const SocialButton(
                    iconSource: "lib/core/resources/vector/google.svg",
                    title: "Google",
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width > 460
                  ? 460
                  : MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32,
              ),
              child: const Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
