import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_academy/Modules/Registration/Login/Login.dart';
import 'package:future_academy/Shared/Components/Components.dart';
import 'package:future_academy/Shared/Local/Cache_Helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class onboardingitems {
  final String image;
  final String title;
  final String body;

  onboardingitems(
      {@required this.image, @required this.title, @required this.body});
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pagecontroller = PageController();
  bool islast = false;
  List<onboardingitems> boarding = [
    onboardingitems(
        image: 'Assets/Images/image-skip@3x.png',
        title: "النجاح والتفوق",
        body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص"),
    onboardingitems(
        image: 'Assets/Images/images@3x.png',
        title: "التعلم الاكاديمى",
        body: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص"),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15, top: 26, bottom: 41),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pagecontroller,
            onPageChanged: (index) {
              if (index == boarding.length - 1) {
                islast = true;
              } else {
                islast = false;
              }
            },
            itemBuilder: (context, index) => OnboardItem(boarding[index]),
            itemCount: 2,
            physics: BouncingScrollPhysics(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                      dotHeight: 7,
                      dotWidth: 15,
                      expansionFactor: 2,
                      spacing: 10,
                      activeDotColor: HexColor('004FA2'),
                      dotColor: HexColor('DFEFFF')),
                  controller: pagecontroller,
                  count: boarding.length),
              Spacer(),
              FloatingActionButton(backgroundColor: HexColor('3F62EC'),
                onPressed: () {
                  if (islast) {
                    gotologinandremove();
                  } else {
                    pagecontroller.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget OnboardItem(onboardingitems model) => Column(
        children: [
          Expanded(
            child: Container(
              width: 384,
              constraints: BoxConstraints(maxHeight: 537,),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage('${model.image}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            model.title,
            style: Theme.of(context)
                .textTheme
                .headline5
          ),
          SizedBox(
            height: 17,
          ),Container(
            width: 399,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Text(
              model.body,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3
            ),
          ),
          SizedBox(height:60 ,)
        ],
      );
  bool isOnboard;
  void gotologinandremove(){
    isOnboard=true;
    CacheHelper.SaveData(key: 'onboard',value:isOnboard ).then((value) {
      if(value)
        return NavigateAndRemove(context, Login(),x: 1,y: 0);
    });
  }
}
