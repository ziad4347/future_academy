import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_academy/Layout/Cubit/FutureStates.dart';
import 'package:future_academy/Modules/Courses/Courses.dart';
import 'package:future_academy/Modules/Department/Department.dart';
import 'package:future_academy/Modules/Home/Home.dart';
import 'package:future_academy/Modules/Profile/Profile.dart';

class FutureCubit extends Cubit<FutureStates>{
  FutureCubit() : super(InitFutureState());
  static FutureCubit get(context) => BlocProvider.of(context);
  List<Widget>screens=[Home(),Department(),Courses(),Profile()];
  List<String>screentitle=['اهلا بيك يا , عمر','التخصصات','كورسات اون لاين','البروفايل'];
  int currentindex = 0;
  changeindex(index) {
    currentindex = index;
    emit(ChangeIndexFutureState());
  }
  int menucurrentindex=0;
  changemenucurrentindex(index) {
    menucurrentindex = index;
    emit(changemenucurrentindexFutureState());
  }
}
