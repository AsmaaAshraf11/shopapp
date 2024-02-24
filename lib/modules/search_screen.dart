import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component/Components.dart';
import '../shared/cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
     var _formkey = GlobalKey<FormState>();
  var searchcontroller = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
                key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        DefaultFormField(
                          Controller: searchcontroller,
                           Label: 'Search', 
                           Prefix: Icons.search, 
                           Type: TextInputType.text,
                            Validator: (value){
                  
                              if(value.isEmpty){
                                return 'rnter text to search';
                              }
                              return null;
                            },
                            onSubmit: (String text){
                              SearchCubit.get(context).search(text);
                            }
                            ),
                            SizedBox(height: 10,),
                             if(state is SearchLoadingState)
                                LinearProgressIndicator(),
                      ],
                                  
                                ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
