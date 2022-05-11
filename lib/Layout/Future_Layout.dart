import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:future_academy/Layout/Cubit/FutureCubit.dart';
import 'package:future_academy/Layout/Cubit/FutureStates.dart';
import 'package:future_academy/Layout/Drawer/Drawer.dart';
import 'package:future_academy/Shared/Components/Components.dart';
import 'package:hexcolor/hexcolor.dart';

class Future_Layout extends StatefulWidget {
  const Future_Layout({Key key}) : super(key: key);

  @override
  State<Future_Layout> createState() => _Future_LayoutState();
}

class _Future_LayoutState extends State<Future_Layout> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      isRtl: true,
      borderRadius: 32,
      menuScreen: Menu(),
      mainScreenScale: .1,
      mainScreenTapClose: true,
      slideWidth: MediaQuery.of(context).size.width * .68,
      menuScreenWidth: MediaQuery.of(context).size.width * .68,
      angle: 0,
      menuBackgroundColor: HexColor('4262E5'),
      mainScreen: BlocConsumer<FutureCubit, FutureStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: GestureDetector(
                onTap: () {
                  ZoomDrawer.of(context).toggle();
                },
                child: Container(
                  width: 40,
                  padding: EdgeInsets.all(10.6),
                  height: 40,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: SvgPicture.asset(
                    'Assets/Images/category.svg',
                    fit: BoxFit.contain,
                    color: HexColor('292D32'),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: HexColor('F2F3F8'), width: 1),
                  ),
                ),
              ),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(FutureCubit.get(context).currentindex==0)
                Image(
                  image: AssetImage('Assets/Images/hhh.png'),
                  width: 23,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                if(FutureCubit.get(context).currentindex!=0)
                  SvgPicture.asset('Assets/SVG/smile.svg'),SizedBox(width: 7.34,),
                Text(
                  FutureCubit.get(context).screentitle[FutureCubit.get(context).currentindex],
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize:FutureCubit.get(context).currentindex==0?18:22, color: Colors.black),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              if (FutureCubit.get(context).currentindex == 0)
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('Assets/Images/Profile@3x.png')),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              if (FutureCubit.get(context).currentindex != 0)
                IconButton(
                    onPressed: () {
                      FutureCubit.get(context).changeindex(0);
                    },
                    icon: Directionality(
                        textDirection: TextDirection.rtl,
                        child: SvgPicture.asset('Assets/SVG/arrow-right.svg',matchTextDirection: true,)))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Center(
                  child: FutureCubit.get(context)
                      .screens[FutureCubit.get(context).currentindex]),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 73,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: HexColor('FFFFFF'), boxShadow: [
                BoxShadow(
                    color: HexColor('D8D8D84E').withOpacity(.1),
                    blurRadius: 40,
                    offset: Offset(0, -16))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomnavicon(
                      onpressed: () {
                        FutureCubit.get(context).changeindex(3);
                      },
                      context: context,
                      labeltext: 'البروفايل',
                      index: 3,
                      image: 'Assets/SVG/user.svg'),
                  bottomnavicon(
                      onpressed: () {
                        FutureCubit.get(context).changeindex(2);
                      },
                      context: context,
                      labeltext: 'كورسات',
                      index: 2,
                      image: 'Assets/SVG/book-saved.svg'),
                  bottomnavicon(
                      onpressed: () {
                        FutureCubit.get(context).changeindex(1);
                      },
                      labeltext: 'التخصص',
                      context: context,
                      index: 1,
                      image:FutureCubit.get(context).currentindex==1?'Assets/SVG/categoryin.svg':'Assets/Images/category.svg'),
                  bottomnavicon(
                      onpressed: () {
                        FutureCubit.get(context).changeindex(0);
                      },
                      labeltext: 'الرئيسية',
                      context: context,
                      index: 0,
                      image: 'Assets/SVG/home-2.svg'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
