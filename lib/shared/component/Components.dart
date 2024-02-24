import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildArticalAtem(artical) {
  return Padding( 
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
           Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                image: NetworkImage('${artical['urlToImage']}'),
                fit: BoxFit.cover,
                ),
            ),
             
           ),
           const SizedBox(width:20),
            Expanded(
              child: Container(
            // height: 120,
                child: Column(
                
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${artical['title']}",style:TextStyle(fontSize: 20,
                         //   fontWeight: FontWeight.bold,
                  fontWeight: FontWeight.w600,
                  ) ,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  ),
                  Text("${artical['publishedAt']}",style: TextStyle(color: Colors.grey,
                  fontWeight: FontWeight.bold
                  ),)
                ],
                         ),
              ),
            )
        ],
      
      ),
    );
}
//  defaultFormField(
//      required TextEditingController controller,
//     required TextInputType type, 
//       Function onSubmit(valu),   
//        Function onchang(), 
//          Function validator(),    
        
      
// ){

//  TextFormField(
//                            controller: controller,
//                            decoration:InputDecoration(
//                                  enabledBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(width: 2),
//                                    borderRadius: BorderRadius.circular(10.0),
//                                     ),
                                    
//                            labelText: "Email",
//                            labelStyle: const TextStyle(fontSize: 25),
//                            hintText: "enter theS Email",
//                            helperStyle: const TextStyle(fontSize:25),
//                                              //  icon: Icon(Icons.alternate_email),
//                                 prefixIcon: Icon(Icons.email),
//                            ) ,
//                              validator: validator(),
//                            keyboardType: type,
//                            onFieldSubmitted:onSubmit(),
//                            onChanged: onchang(valu),
                           
//                            );

// }
Widget DefaultFormField({
  required TextEditingController Controller,
  required TextInputType Type,
  required Validator,
  onChange,
  onSubmit,
  onTap,
  bool ispassword=false,
  bool IsClickable = true,
  required String Label,
  required IconData Prefix,
  IconData? suffix,
  String? hintText, 
}) =>
    TextFormField(
      controller: Controller,
      keyboardType: Type,
      obscureText:ispassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      style: const TextStyle(fontSize: 20),
      enabled: IsClickable,
      validator: Validator,
      decoration: InputDecoration(
        labelText: Label,
        labelStyle: const TextStyle(fontSize: 25),
        hintText:hintText,
        helperStyle: const TextStyle(fontSize:25),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelStyle: const TextStyle(fontSize: 24),
        prefixIcon: Icon(Prefix),
        suffixIcon:suffix!=null? Icon(suffix):null,
        enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(width: 2),
          borderRadius: BorderRadius.circular(10.0),
     ),
      ),
    );


   Widget defaultButton( {required String text,required Function onPressed}){

    return  MaterialButton(
                                  minWidth: double.infinity,
                                  color:
                                      const Color.fromARGB(255, 76, 144, 175),
                                  height: 50,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child:  Text(
                                    text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  onPressed: ()
                                   {
                                  onPressed;
                                  }
                                  );
   }
    void showToast({required String text,
      required ToastStates states
    }){
       Fluttertoast.showToast(
        msg:text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor:ChooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0
    );
    //enum ToastStates{SUCCESS,ERROR,WARNING};
    
    }
    enum ToastStates{
  SUCCESS,
  ERROR,
  WARNING,
}
Color ChooseToastColor(ToastStates states){
  Color color;
  switch(states)
  {
    case ToastStates.SUCCESS:
    return color=Colors.green;
   break;
    case ToastStates.ERROR:
    return color= Colors.red;
   break;
    case ToastStates.WARNING:
    return color=Colors.amber;
   break;
  }
  return color;
}
Widget myDivider(){
  return Padding(
         padding: const EdgeInsetsDirectional.only(
          start: 20,
         ),
         child: Container(
       
          width: double.infinity,
          height: 2,
          color: Colors.grey[300],
         ),
       ) ;
}
