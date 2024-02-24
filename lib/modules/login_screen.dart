import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/network/local/cache_helper.dart';

import '../layout/shop_layout.dart';
import '../shared/component/Components.dart';
import '../shared/component/Constants.dart';
import '../shared/cubit/shop_cubit.dart';
import 'Register_screen.dart';

class LoginScreen extends StatelessWidget {

  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();

  var _formkey = GlobalKey<FormState>();

  bool hidePasswor = true;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ShopCubit(),
        child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {
            if(state is ShopLogingSuccessState){
              if(state.loginModel.status){
               // print(state.loginModel.message);
               // print(state.loginModel.data!.token);
               CacheHelper.SaveData(key: 'token', value: state.loginModel.data?.token).then((value) {
                 token=state.loginModel.data!.token;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopLayout(),
                  ),
                  (route) => false);
               });
              } 
              else{
               // print(state.loginModel.message);
               showToast(states: ToastStates.ERROR, text: state.loginModel.message);
              }              
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    // ignore: sized_box_for_whitespace
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                            color: Color.fromARGB(255, 76, 144, 175),
                            width: 5,
                          ))),
                          child: const Text(
                            "Shop",
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        const Text(
                          "login nowto browse our offers ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: "Email",
                                labelStyle: const TextStyle(fontSize: 25),
                                hintText: "enter theS Email",
                                helperStyle: const TextStyle(fontSize: 25),
                                //  icon: Icon(Icons.alternate_email),
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (val) {
                                if ((val!.isEmpty) || !val.contains('@')) {
                                  return "Invald Email";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (valu) {},
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: passwordController,
                              onFieldSubmitted: (valu) {
                                if (_formkey.currentState!.validate()) {
                                  ShopCubit.get(context).UserLogin(
                                      email: emailcontroller.text.trim(),
                                      password: passwordController.text.trim());
                                  
                                }
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: "password",
                                labelStyle: const TextStyle(fontSize: 25),
                                hintText: "enter password",
                                helperStyle: const TextStyle(fontSize: 25),
                                prefixIcon: const Icon(
                                    //icon: const Icon(Icons.visibility),
                                    Icons.lock // onPressed: () {  },

                                    ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                         ShopCubit.get(context).suffix,
                                        ),
                                  onPressed: () {
                                  ShopCubit.get(context).changPasswordVisibility();

                                  },
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: ShopCubit.get(context).hidePasswor,
                              validator: (val) {
                                if ((val!.isEmpty) || val.length <= 5) {
                                  return "Password is too short";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            ConditionalBuilder(
                              builder: (BuildContext context) => MaterialButton(
                                  minWidth: double.infinity,
                                  color:
                                      const Color.fromARGB(255, 76, 144, 175),
                                  height: 50,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: const Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      ShopCubit.get(context).UserLogin(
                                          email: emailcontroller.text.trim(),
                                          password:
                                              passwordController.text.trim());
                                     // print(emailcontroller.text);
                                      // print(passwordController.text);
                                    }
                                  }),
                              condition: state is! ShopLogingLoadingState,
                              fallback: (BuildContext context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => {
                                     Navigator.push(context, MaterialPageRoute(builder:((context) =>Register()))),
                                  },
                                  child: const Text(
                                    "Register Now  ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 76, 144, 175),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
