import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/core/extensions/build_context_ext.dart';
import 'package:flutter_agribisnisku/data/datasources/auth_local_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/button.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../data/models/requests/login_request_model.dart';
import '../../home/pages/home_page.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 255),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                "assets/images/logo.png",
                width: 70,
                height: 200,
              )),
          // const SizedBox(height: 5.0),
          const Center(
            child: Text(
              "AGRIBisnis Ku",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Center(
            child: Text("Masuk untuk melanjutkan ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                )),
          ),
          const SizedBox(height: 10.0),
          CustomTextField(
            controller: emailController,
            label: 'email',
          ),
          const SizedBox(height: 12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 24.0),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  success: (data) {
                    AuthLocalDatasource().saveAuthData(data);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Login Succes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                    context.pushReplacement(const HomePage());
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => Button.filled(
                        onPressed: () {
                          final requestModel = LoginRequestModel(
                              identifier: emailController.text,
                              password: passwordController.text);
                          context
                              .read<LoginBloc>()
                              .add(LoginEvent.login(requestModel));
                        },
                        label: 'Masuk',
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ));
            },
          ),
          const SizedBox(height: 122.0),
          Center(
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ChangePassword(),
                //   ),
                // );
              },
              child: const Text.rich(
                TextSpan(
                  text: "Lupa sandi anda? ",
                  children: [
                    TextSpan(
                      text: "Buat sandi baru",
                      style: TextStyle(color: Color.fromARGB(255, 0, 65, 117)),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
