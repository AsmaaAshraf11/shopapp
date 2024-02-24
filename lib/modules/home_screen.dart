//import 'dart:js';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopapp/models/category_model.dart';
import '../models/hom_model.dart';
import '../shared/component/Components.dart';
import '../shared/cubit/shop_cubit.dart';

class ProductsScreen extends StatelessWidget {
  // const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if(state is ShopSuccessChangFavoritsState){
          if(!state.changFavoritModel.status){
            showToast(states:ToastStates.ERROR, text:state.changFavoritModel.message);

          }
        }
      },
      builder: (context, state) {
            var products = ShopCubit.get(context).dataModel;
            var categories = ShopCubit.get(context).categorymodel;

        return ConditionalBuilder(
          builder: (BuildContext context) => productBuilder(products!,categories!,context),
          condition: products !=null&&categories!=null,
          fallback: (BuildContext context) =>
              Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productBuilder(HomeModel model,CategoryModel categoryMpdel,context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider (
              items: model.data.banners
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 235,
                  initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal)),
          SizedBox(
            height: 10,
          ),
           Padding(
             padding: EdgeInsets.symmetric(
              horizontal: 10,
             ),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Categories',
                 style: TextStyle(fontSize: 24,
                 fontWeight: FontWeight.w800),
                 ),
                  SizedBox(
            height: 10,
          ),
                    Container(
                     height: 100,
                 child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>categoryItem(categoryMpdel.data.data[index]), 
                 separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  itemCount:categoryMpdel.data.data.length),
                    ),

                    SizedBox(
                     height: 20,
                      ),
                    Text('New products',
           style: TextStyle(fontSize: 24,
           fontWeight: FontWeight.w800),
           ),
               ],
             ),
           ),
          
          
          Container(
           // color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1/1.52,
              children: List.generate(model.data.products.length,
                  (index) => buildGridproduct(model.data.products[index],context)),
            ),
          ),
        ],
      ),
    );
  }

 Widget categoryItem(Datum model){
  return  Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image(
                image: NetworkImage(model.image),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
            color: Colors.black.withOpacity(0.8),

                width: 100,
                child: Text(
                  model.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          );
 }
  Widget buildGridproduct(productsModel model,context) {
                var cubit=ShopCubit.get(context).favorite;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: double.infinity,
              height: 190,
              //fit: BoxFit.cover,
            ),
             if(model.discount!=0)
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
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 1.3
                ),
              ),
              Row(
                children: [
                  Text('${model.price}',
                  style: const TextStyle(
                    fontSize: 13,
                    //color:Colors.teal,
                      color: Colors.blue,
                    fontWeight: FontWeight.bold
                    ),
                  ),
            
                  const SizedBox(width: 5,),
                  if(model.discount!=0)
                    Text('${model.old_price}',
                  style: const TextStyle(
                    fontSize: 10,
                      color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough
                    ),
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){
                    ShopCubit.get(context).ChangFavorits(model.id);
                    print(model.id);
                    print(model.in_favorites);
                  }, 
                  icon:  
                  //CircleAvatar(
                    //radius: 15,
                   // backgroundColor:cubit[model.id]!?Colors.red:Colors.grey,
                   // child: 
                    Icon(Icons.favorite,
                    size: 18,
                    color:cubit[model.id]!?Colors.red:Colors.grey,
                    ),
                //  )
                  
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
