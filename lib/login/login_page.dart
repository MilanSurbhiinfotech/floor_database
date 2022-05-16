import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floor/login/loginpage_cubit.dart';

import '../utils.dart';
import 'loginpage_states.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit loginCubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: BlocConsumer(
                bloc: loginCubit, builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Login",style: TextStyle(fontSize: 25),),
                      SizedBox(height: 30,),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: "Email",
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            contentPadding: EdgeInsets.symmetric(horizontal: 10)
                        ),
                      ),
                      const SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          var email = emailController.text.toString();
                          var password = passwordController.text.toString();
                          loginCubit.login(email, password, "admin");
                        },
                        child: ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text("Login",style: TextStyle(fontSize: 18),)
                        ),
                      )
                    ],
                  ),
                );

              }, listener: (context,state) {
                if (state is LoginLoadingState) {
                  Utils.showLoader(context);
                } else if (state is LoginErrorState) {
                  //show Toast with message
                  Utils.hideLoader(context);
                  Utils.showToast(context,state.message);
                }
              },
              )
            ),
          ),
        ),
      ),
    );
  }
}
