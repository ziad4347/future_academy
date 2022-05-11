import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_academy/Layout/Future_Layout.dart';
import 'package:future_academy/Modules/Registration/Login/Login.dart';
import 'package:future_academy/Shared/Components/Components.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var departmentcontroller = TextEditingController();
  var studyyearcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  void dispose() {
emailcontroller.dispose();
passwordcontroller.dispose();
namecontroller.dispose();
departmentcontroller.dispose();
studyyearcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 47.05,bottom: 12),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 158.8,
                  height: 158.48,
                  child: Image(
                    image: AssetImage('Assets/Images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 8.97,
                ),
                Text(
                  'عمل حساب جديد',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 26),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'برجاء تسجيل الدخول للاكاديمية',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3.copyWith(),
                ),
                SizedBox(
                  height: 29.4,
                ),
                Inputfield(
                    controller: namecontroller,
                    text: 'الاسم بالكامل',
                    context: context,
                    suffixicon: Image(
                      width: 13.42,
                      height: 15.1,
                      image: AssetImage('Assets/Images/Icon feather-user@3x.png'),
                      fit: BoxFit.cover,
                    ),
                    keyboardType: TextInputType.name),
                SizedBox(
                  height: 25,
                ),
                Inputfield(
                    controller: departmentcontroller,
                    text: 'القسم الدراسي',
                    context: context,
                    suffixicon: Image(
                      width: 16.42,
                      height: 14.2,
                      image: AssetImage('Assets/Images/certificate@3x.png'),
                      fit: BoxFit.cover,
                    ),
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 25,
                ),
                Inputfield(
                    controller: studyyearcontroller,
                    text: 'السنة الدراسية',
                    context: context,
                    suffixicon: Image(
                      width: 16.42,
                      height: 14.2,
                      image: AssetImage('Assets/Images/certificate@3x.png'),
                      fit: BoxFit.cover,
                    ),
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 25,
                ),
                Inputfield(
                    controller: emailcontroller,
                    text: 'البريد الالكترونى',
                    context: context,
                    suffixicon: Image(
                      width: 18,
                      height: 18,
                      image: AssetImage('Assets/Images/mail@3x.png'),
                      fit: BoxFit.cover,
                    ),
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 25,
                ),
                Inputfield(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  ispassword: true,
                  text: 'كلمة المرور',
                  context: context,
                  suffixicon: Image(
                    width: 13.16,
                    height: 15,
                    image:
                    AssetImage('Assets/Images/vuesax-linear-lock@3x.png'),
                    fit: BoxFit.cover,
                  ),
                  preicon: Image(
                    width: 14.26,
                    height: 12.12,
                    image: AssetImage('Assets/Images/password@3x.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: HexColor('274FEA'),
                      borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: () {   NavigatewithAnimate(context, Future_Layout());},
                    child: Text(
                      'عمل حساب جديد',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: HexColor('FFFFFF'), fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: () {
                      NavigatewithAnimate(context, Future_Layout());
                    },
                    child: Text(
                      'تخطى التسجيل',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 16, color: HexColor('274FEA')),
                    )),
                SizedBox(
                  height: 47.6,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {NavigatewithAnimate(context, Login());},
                        child: Text(
                          'تسجيل دخول',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              fontSize: 16, color: HexColor('5271EE')),
                        )),
                    Text('لدى حساب بالفعل؟',style: Theme.of(context).textTheme.headline3.copyWith(color: HexColor('000000'),fontSize: 16),)
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
