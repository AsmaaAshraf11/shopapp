import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/shop_layout.dart';
import '../network/local/cache_helper.dart';
import '../shared/component/Components.dart';
import '../shared/component/Constants.dart';
import '../shared/cubit/shop_cubit.dart';

class Register extends StatelessWidget {
  var _formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();

  var passwordController = TextEditingController();
  var namecontroller = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
        if(state is ShopRegisteruccessState){
              if(state.registerModel.status){
               // print(state.loginModel.message);
                print(state.registerModel.data!.token);
               CacheHelper.SaveData(key: 'token', value: state.registerModel.data.token).then((value) {
                 token=state.registerModel.data.token;
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
               showToast(states: ToastStates.ERROR, text: state.registerModel.message);
              }              
            }  
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    // ignore: sized_box_for_whitespace
                    const Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          "Register nowto browse our offers ",
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
                            DefaultFormField(
                              Controller: namecontroller,
                              Label: 'User Name',
                              Prefix: Icons.person,
                              Type: TextInputType.name,
                              Validator: (valu) {
                                if (valu.isEmpty) {
                                  return "please enter your name ";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DefaultFormField(
                              Controller: emailcontroller,
                              Label: 'Email Address',
                              Prefix: Icons.email,
                              Type: TextInputType.emailAddress,
                              Validator: (valu) {
                                if ((valu!.isEmpty) || !valu.contains('@')) {
                                  return "Invald Email";
                                }
                                return null;
                              },
                            ),
                            //Invald Email
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: passwordController,
                              onFieldSubmitted: (valu) {
                                // if (_formkey.currentState!.validate()) {
                                //   ShopCubit.get(context).UserLogin(
                                //       email: emailcontroller.text.trim(),
                                //       password: passwordController.text.trim());
                                // }
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
                                    ShopCubit.get(context)
                                        .changPasswordVisibility();
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
                            SizedBox(
                              height: 20,
                            ),
                            DefaultFormField(
                              Controller: phoneController,
                              Label: 'phone ',
                              Prefix: Icons.phone,
                              Type: TextInputType.phone,
                              Validator: (valu) {
                                if (valu!.isEmpty) {
                                  return "phone must note be empte";
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
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      ShopCubit.get(context).UserRegister(
                                          email: emailcontroller.text.trim(),
                                          password: passwordController.text.trim(),
                                          name: namecontroller.text,
                                          phone: phoneController.text
                                          );

                                     // print(emailcontroller.text);
                                      //print(passwordController.text);
                                    }
                                  }),
                              condition: 
                              state is! ShopRegisterLoadingState,
                              fallback: (BuildContext context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
