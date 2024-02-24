import 'package:flutter/material.dart';

import '../../modules/login_screen.dart';
import '../../network/local/cache_helper.dart';

void SignOut(context){
   CacheHelper.removData(key: 'token').then((value) {
                  if (value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  }
                });
}
var token;
var onboarding;


void SIGNOUT(context){
   CacheHelper.removData(key: 'token').then((value) {
                  if (value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  }
                });

}
