import 'package:flutter/material.dart';
import 'package:shopapp/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class BoardindModel {
  final String image;
  final String title;
  final String body;

  BoardindModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardindModel> boarding = [
    BoardindModel(
        image: 'assets/images/image3.jpg', title: 'Online shopping', body: 'Welcome to online shopping'),
    BoardindModel(
        image: 'assets/images/image2.jpg', title: 'Online shopping', body: 'You can buy from the comfort of your home'),
    BoardindModel(
        image: 'assets/images/image1.jpg', title: 'Online shopping', body: "Don't worry about payment, you can pay online"),
         BoardindModel(
        image: 'assets/images/image8.jpg', title: 'Online shopping', body: '')
  ];

  var boarderController = PageController();

  bool islast = false;
  void submit(){
    CacheHelper.SaveData(key:'onboardin', value:true).then((value) {
     if(value){
        Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
    } 
    }
    
    );
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text('SKIP'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boarderController,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    print('last');
                    setState(() {
                      islast = true;
                    });
                  } else {
                    (' notlast');
                    setState(() {
                      islast = false;
                    });
                  }
                },
                //  physics: BouncingScrollPhysics,
                itemBuilder: ((BuildContext context, int index) =>
                    buildBoardingItem(boarding[index])),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: boarderController, count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                    activeDotColor: Color.fromARGB(255, 76, 144, 175),
                  ),
                  // onDotClicked: ,
                ),
                // Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (islast) {
                     submit();
                    } else {
                      boarderController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.linear);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardindModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(image: AssetImage('${model.image}')),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          '${model.title}',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '${model.body}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
