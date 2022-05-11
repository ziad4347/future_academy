import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:future_academy/Layout/Cubit/FutureCubit.dart';
import 'package:future_academy/Layout/Cubit/FutureStates.dart';
import 'package:future_academy/Layout/Drawer/Menuitems.dart';
import 'package:future_academy/Layout/Future_Layout.dart';
import 'package:hexcolor/hexcolor.dart';

class Menu extends StatefulWidget {
  const Menu({Key key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
 List<int> mainindexs=[0,1,2,10];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FutureCubit, FutureStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: HexColor('4262E5'),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  ZoomDrawer.of(context).close();
                },
                icon: Icon(Icons.clear),
              ),
              actions: [
                Row(
                  children: [
                    Text(
                      'عمر ابراهيم',
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: HexColor('FFFFFF'), fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AnimatedContainer(
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
                    SizedBox(
                      width: 15,
                    )
                  ],
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                  FutureCubit.get(context).changemenucurrentindex(index);
                  if(mainindexs.contains(FutureCubit.get(context).menucurrentindex))
                    {
                      if(FutureCubit.get(context).menucurrentindex!=10)
                        FutureCubit.get(context).changeindex(FutureCubit.get(context).menucurrentindex);
                      else
                        FutureCubit.get(context).changeindex(3);
                    }
                  ZoomDrawer.of(context).close();
                    },
                    highlightColor: Colors.grey.withOpacity(.5),
                    child: Container(
                      height: 44,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              MenuItems.allmenu[index].name,
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                  fontSize: 16, color: FutureCubit.get(context).menucurrentindex==index?HexColor('FFFFFF'):HexColor('FFFFFF').withOpacity(.5)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              MenuItems.allmenu[index].image,
                              fit: BoxFit.cover,
                              color: FutureCubit.get(context).menucurrentindex==index?HexColor('FFFFFF'):HexColor('FFFFFF').withOpacity(.5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  itemCount: MenuItems.allmenu.length),
            ),
          );
        });
  }
}
