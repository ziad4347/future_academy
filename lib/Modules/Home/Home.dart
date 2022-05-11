import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_academy/Modules/Department/DepartmentItems.dart';
import 'package:future_academy/Shared/Components/Components.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  List<String> serviceimages = [
    'Assets/Images/الاخبار والاحداث@3x.png',
    'Assets/Images/طلب الالتحاق@3x.png',
    'Assets/Images/جدول الدراسى@3x.png',
    'Assets/Images/كورسات@3x.png',
    'Assets/Images/شركاء النجاح@3x.png',
    'Assets/Images/اتصل بنا@3x.png',
  ];
  List<String> servicename = [
    'الاخبار والاحداث',
    'طلب الالتحاق',
    'جدول الدراسى',
    'الكورسات',
    'شركاء النجاح',
    'اتصل بنا',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          adcard(context),
          SizedBox(
            height: 14,
          ),
          Departtile(context, 'الاقسام'),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 130,
            child: ListView.separated(
                itemCount: DepartmentItems.hommedepart.length,
                reverse: true,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) {
                  return DepartItemBuilder(index, context,
                      title: DepartmentItems.hommedepart[index].name,
                      image: DepartmentItems.hommedepart[index].image,
                      width: 121,
                      height: 130);
                }),
          ),
          SizedBox(
            height: 16,
          ),
          Departtile(context, 'الخدمات'),
          SizedBox(
            height: 22,
          ),
          GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            children: List.generate(serviceimages.length,
                (index) => ServiceItemBuilder(index, context)),
          ),
          SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }

  Widget ServiceItemBuilder(index, context) => Container(
        width: 112,
        height: 111,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: HexColor('FFFFFF'),
            border: Border.all(color: HexColor('EEEEEE'), width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              serviceimages[index],
              height: 70,
              fit: BoxFit.cover,
            ),
            Text(
              servicename[index],
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(fontSize: 14, color: HexColor('000000')),
            )
          ],
        ),
      );

  Widget Departtile(context, title) => Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 32,
              padding: EdgeInsets.all(8),
              height: 32,
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
          Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 20),
          )
        ],
      );
}
