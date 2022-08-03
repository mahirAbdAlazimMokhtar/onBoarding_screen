import 'package:flutter/material.dart';
import 'package:on_boarding/generated/assets.dart';
import 'package:on_boarding/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                )),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: const [
              CreatePage(
                  image: Assets.imagesDelivery_one,
                  title: 'Delivery Every Where',
                  description:
                      'We are Always ready to Delivery your items quickly and professionally'),
              CreatePage(
                  image: Assets.imagesDelivery_two,
                  title: 'Delivery Every Where',
                  description:
                      'We are Always ready to Delivery your items quickly and professionally'),
              CreatePage(
                  image: Assets.imagesDelivery_three,
                  title: 'Delivery Every Where',
                  description:
                      'We are Always ready to Delivery your items quickly and professionally'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 80.0),
            child: Row(
              children: _buildIndicators(),
            ),
          ),
          Positioned(
            bottom: 60.0,
              right: 50.0,
              child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              if (currentIndex <2){
                currentIndex ++;
                if(currentIndex< 3){
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInCirc);
                }
              }else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
              }
            },
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }

  //create Animated widget Decoration
  Widget _indicatorsWidget(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        height: 8.0,
        width: isActive ? 25.0 : 8.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (i == currentIndex) {
        indicators.add(_indicatorsWidget(true));
      } else {
        indicators.add(_indicatorsWidget(false));
      }
    }
    return indicators;
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 300,
              child: Image.asset(
                image,
              )),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade300),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            description,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade300),
          ),
        ],
      ),
    );
  }
}
