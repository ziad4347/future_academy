import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_academy/Layout/Cubit/FutureCubit.dart';
import 'package:future_academy/Modules/Department/DepartmentItems.dart';
import 'package:hexcolor/hexcolor.dart';

Future NavigateAndRemove(context, Widget Page, {double x = 0, double y = 1}) =>
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (context, animation, animationtime, child) {
              final tween =
                  Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, animationtime) {
              return Page;
            }),
        (Route<dynamic> route) => false);

Widget Inputfield(
        {@required TextEditingController controller,
        @required String text,
        @required BuildContext context,
        Widget preicon,
        Widget suffixicon,
        bool ispassword = false,
        TextInputType keyboardType = TextInputType.text}) =>
    Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: HexColor('F2F3F8'), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 11, right: 11),
        child: SafeArea(
          bottom: true,
          top: false,
          child: Row(
            children: [
              if (preicon != null) preicon,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: TextField(
                    obscureText: ispassword,
                    textAlign: TextAlign.end,
                    controller: controller,
                    keyboardType: keyboardType,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        hintText: text,
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.headline3),
                  ),
                ),
              ),
              if (suffixicon != null)
                SizedBox(
                  width: 12,
                ),
              if (suffixicon != null) suffixicon
            ],
          ),
        ),
      ),
    );

Future NavigatewithAnimate(
  context,
  Widget Page, {
  double x = 1,
  double y = 0,
  bool fade = false,
  int duration = 100,
}) =>
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: duration),
            reverseTransitionDuration: Duration(milliseconds: duration),
            transitionsBuilder: (context, animation, animationtime, child) {
              final tween =
                  Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
              return fade
                  ? FadeTransition(
                      opacity: animation,
                      child: child,
                    )
                  : SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
            },
            pageBuilder: (context, animation, animationtime) {
              return Page;
            }));

Widget bottomnavicon(
        {@required BuildContext context,
        @required int index,
        IconData icon,
          String labeltext,
        @required Function onpressed,
        String image}) =>
    InkWell(
      onTap: onpressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(image,fit: BoxFit.cover,color: FutureCubit.get(context).currentindex == index
              ? HexColor('5271EE')
              : HexColor('BABABA'),) ??
              Icon(
                icon,
                color: FutureCubit.get(context).currentindex == index
                    ? HexColor('5271EE')
                    : HexColor('BABABA'),
              ),
          if(labeltext!=null)
          SizedBox(
            height: 4,
          ),
          if(labeltext!=null)
          Text(
            labeltext,
            style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 12,
                color: FutureCubit.get(context).currentindex == index
                    ? HexColor('5271EE')
                    : HexColor('BABABA')),
          )
        ],
      ),
    );
Widget adcard(context)=>Stack(
  alignment: Alignment.bottomLeft,
  children: [
    Container(
      width: double.infinity,
      height: 158,
      alignment: Alignment.topRight,
      padding: EdgeInsets.only(right: 17, top: 26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor('2144D4'),
                HexColor('274FEA'),
                HexColor('5271EE'),
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '🔥 افضل مكان اكاديمى',
            textAlign: TextAlign.right,
            style: Theme
                .of(context)
                .textTheme
                .headline5
                .copyWith(fontSize: 16, color: HexColor('FFFFFF')),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            width:
            MediaQuery
                .of(context)
                .size
                .width >= 390 ? 200 : 140,
            child: Text(
              'مكان لتعليم الطلاب المواد التعلمية مع افضل كودار',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontSize: 14, color: HexColor('FFFFFF')),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            width: 31,
            alignment: Alignment.center,
            height: 31,
            decoration: BoxDecoration(
                color: HexColor('F8931F'), shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_forward_ios,
              color: HexColor('FFFFFF'),
              size: 10,
            ),
          )
        ],
      ),
    ),
    Image(
      image: AssetImage('Assets/Images/صورة شخصية@3x.png'),
      height: 181,
      width: 150,
      fit: BoxFit.cover,
    )
  ],
);
Widget DepartItemBuilder(index, context,{@required String title,@required String image,double width, double height,bool ishome=true}) =>
    Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: index == 0&& ishome? HexColor('F8931F') : HexColor('FFFFFF'),
              border: Border.all(
                  width: index == 0 && ishome? 0 : 1, color: HexColor('F2F3F8')),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 47.69,
                height: 49.5,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 4.5,
              ),
              Container(
                  width: 64,
                  child: Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline3
                        .copyWith(
                        fontSize: 16,
                        color: index == 0&& ishome
                            ? HexColor('FFFFFF')
                            : HexColor('000000')),
                  ))
            ],
          ),
        ),
      ],
    );