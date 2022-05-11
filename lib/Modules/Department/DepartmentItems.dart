import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

import 'package:future_academy/Modules/Department/Department.dart';

class DepartmentItem{
  final String image;
  final String name;
  const DepartmentItem(this.name,this.image);
}
class DepartmentItems{
  List<String> departimages = [
    '',
    '',
    ''
  ];
  List<String> departname = [
    '',
    '',

  ];
  static const engineer = DepartmentItem('المساحة والهندسة', 'Assets/Images/Engineer@3x.png');
  static const cs = DepartmentItem('تكنولوجيا المعلومات', 'Assets/Images/Mask Group 2@3x.png');
  static const medical = DepartmentItem( 'التحاليل الطبية', 'Assets/Images/raxs@3x.png');
  static const news = DepartmentItem('الصحافة واعلام', 'Assets/Images/Journalism@3x.png');
  static const manger = DepartmentItem('إدارة الاعمال', 'Assets/Images/manager@3x.png');
  static const medicalservice = DepartmentItem('خدمات الطبية', 'Assets/Images/التمريض@3x.png');

  static const hommedepart=<DepartmentItem>[
    engineer,cs,medical
  ];
  static const alldepartments=<DepartmentItem>[
    cs,engineer,news,medical,medicalservice,manger
  ];
}