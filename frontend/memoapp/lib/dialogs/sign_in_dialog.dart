import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoapp/utilities/dependencies.dart' as dependencies;

class SignInDialog extends StatefulWidget {
  const SignInDialog({super.key});

  @override
  State<SignInDialog> createState() => _SignInDialogState();
}

class _SignInDialogState extends State<SignInDialog> {
  RxString status = 'credentials'.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Widget credentialsWidget() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'Sign In to Memo Account',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: 300,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            controller: emailController,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            controller: passwordController,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  status.value = 'signing-in';
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text(
                            'Fill in all the credentials',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      });
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        )
      ],
    );
  }

  Widget signingInWidget() {
    return FutureBuilder(
      future: Get.find<dependencies.AuthController>().signIn(
        emailController.text,
        passwordController.text,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signing In'),
              SizedBox(height: 30),
              CircularProgressIndicator(),
            ],
          ));
        } else {
          if (snapshot.data == 'success') {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                Get.offNamed('/memo_page');
              },
            );
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Successfully signed in'),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          status.value = 'cresentials';
                        },
                        child: const Text('Try Again'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => status.value == 'credentials'
            ? credentialsWidget()
            : status.value == 'signing-in'
                ? signingInWidget()
                : const SizedBox(),
      ),
    );
  }
}
