import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component/Components.dart';
import '../shared/component/Constants.dart';
import '../shared/cubit/shop_cubit.dart';

class SettingScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var model= ShopCubit.get(context).userModel;
        nameController.text = model!.data.name;
         emailcontroller.text = model.data.email;
           phonecontroller .text= model!.data.phone;
          // passwordController.text=model.
        return ConditionalBuilder(
          builder: (BuildContext context)=>SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,

                child: Column(
                  children: [
                    if(state is ShopLoadingUpdateDataState)
                    LinearProgressIndicator(),
                     SizedBox(
                      height: 20,
                    ),
                    DefaultFormField(
                      Controller: nameController,
                      Label: 'Name',
                      Prefix: Icons.person,
                      Type: TextInputType.name,
                      Validator: (valu) {
                        if (valu.isEmpty) {
                          return "name must note be empte";
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
                          return "Email must note be empte";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // DefaultFormField(
                    //   Controller: passwordController,
                    //  Label: 'password', 
                    //  Prefix: Icons.lock, 
                    //  suffix: ShopCubit.get(context).suffix ,
                    //  Type: TextInputType.visiblePassword,
                    //   Validator: (val) {
                    //               if ((val!.isEmpty) || val.length <= 5) {
                    //                 return "Password is too short";
                    //               }
                    //               return null;
                    //             },
                      
                    //   ),
                    //   SizedBox(
                    //   height: 20,
                    // ),
                    DefaultFormField(
                      Controller: phonecontroller,
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
              
                                    defaultButton(
                                      onPressed: (){
                                        if (_formkey.currentState!.validate()) {
                                        ShopCubit.get(context).UpdateUserData(
                                            email: emailcontroller.text.trim(),
                                           // password: passwordController.text.trim(),
                                             name: nameController.text, 
                                             phone: phonecontroller.text);
                                      }
       } ,text: 'update'),
                    const SizedBox(height: 20),
                                MaterialButton(
                                    minWidth: double.infinity,
                                    color:
                                        const Color.fromARGB(255, 76, 144, 175),
                                    height: 50,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: const Text(
                                      "LOG OUT",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    onPressed: ()
                                     {
                                    SIGNOUT(context);
                                    }
                                    ),
                                 
                  ],
                ),
              ),
                   
            ),
          ), 
          condition:  ShopCubit.get(context).userModel !=null,
           fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
