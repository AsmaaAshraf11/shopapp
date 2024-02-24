import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/favorit_model.dart';
import '../shared/component/Components.dart';
import '../shared/cubit/shop_cubit.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
      },
      builder: (context, state) {
          var favorit = ShopCubit.get(context).favoritModel;

        return ListView.separated(
            itemBuilder: (context, index) =>
                BuildfavoritItem(favorit!.data.data![index],),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 10);
      },
    );
  }
  Widget BuildfavoritItem(FavoratData model){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage( "hticons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg"),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                 if(1!=0)
             Container(
              color: Colors.red,
              padding:const EdgeInsets.symmetric(horizontal: 10),
              child: const Text('DISCOUNT',
                      style: TextStyle(
                        fontSize: 10,
                        //color:Colors.teal,
                          color: Colors.white,
                        fontWeight: FontWeight.bold
                        ),
                      ),
             )
              ],
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("electrionic devices",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.3
                    ),
                  ),
                 Spacer(),
                  Row(
                    children: [
                      Text('{model.price}',
                      style: const TextStyle(
                        fontSize: 13,
                        //color:Colors.teal,
                          color: Colors.blue,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                
                      const SizedBox(width: 5,),
                      if(1!=0)
                        Text('{model.old_price}',
                      style: const TextStyle(
                        fontSize: 10,
                          color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough
                        ),
                      ),
                      const Spacer(),
                      IconButton(onPressed: (){
                      //  ShopCubit.get(context).ChangFavorits(model.id);
                        
                      }, 
                      icon:  
                      //CircleAvatar(
                        //radius: 15,
                       // backgroundColor:cubit[model.id]!?Colors.red:Colors.grey,
                       // child: 
                        Icon(Icons.favorite,
                        size: 18,
                        //color:cubit[model.id]!?Colors.red:Colors.grey,
                        ),
                    //  )
                      
                      ),
                    ],
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