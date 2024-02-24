import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/category_model.dart';
import '../shared/component/Components.dart';
import '../shared/cubit/shop_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
      },
      builder: (context, state) {
          var categories = ShopCubit.get(context).categorymodel;

        return ListView.separated(
            itemBuilder: (context, index) =>
                CategoryItem(categories!.data.data[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: categories!.data.data.length);
      },
    );
  }

  Widget CategoryItem(Datum model) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            model.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
