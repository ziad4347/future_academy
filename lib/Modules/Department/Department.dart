import 'package:flutter/material.dart';
import 'package:future_academy/Modules/Department/DepartmentItems.dart';
import 'package:future_academy/Shared/Components/Components.dart';

class Department extends StatelessWidget {
  const Department({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          adcard(context),
          SizedBox(
            height: 19,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الاقسام',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          GridView.count(
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing:10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            children: List.generate(DepartmentItems.alldepartments.length,
                (index) => DepartItemBuilder(index, context,ishome: false,
                    title: DepartmentItems.alldepartments[index].name,
                    image: DepartmentItems.alldepartments[index].image,
                    width: 156,
                    height: 168)),
          ),
          SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }
}
