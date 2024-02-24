
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/network/local/cache_helper.dart';

import '../modules/login_screen.dart';
import '../modules/search_screen.dart';
import '../shared/cubit/shop_cubit.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
      
      },
      builder: (context, state) {
        var cubit=ShopCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('salla'),
              //backgroundColor: Colors.amber,
              actions: [
                IconButton(onPressed: (){
                 // Navigator.pushNamed(context, SearchScreen());
        Navigator.push(context, MaterialPageRoute(builder:((context) => const SearchScreen())));
        //  Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => SearchScreen(),
        //           ),
        //           (route) => true);

                },
                 icon: Icon(Icons.search)
                 )
              ],
            ),
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                cubit.changBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: ShopCubit.get(context).BottomItem
              ),
            
            );
      },
    );
  }
}
