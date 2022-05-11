import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_academy/Layout/Future_Layout.dart';
import 'package:future_academy/Modules/Registration/Signup/SignUp.dart';
import 'package:future_academy/Shared/Components/Components.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(toolbarHeight: 0,),
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
                  'تسجيل الدخول',textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 26),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'برجاء تسجيل الدخول للاكاديمية',textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3.copyWith(),
                ),
                SizedBox(
                  height: 29.6,
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
                  height: 29.6,
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
                  height: 18.4,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'هل نسيت كلمة المرور ؟',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              fontSize: 16, color: HexColor('F8931F')),
                        ))),
                SizedBox(
                  height: 55.6,
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
                      'تسجيل الدخول',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: HexColor('FFFFFF'), fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 47.6,
                ),
                TextButton(
                    onPressed: () {   NavigatewithAnimate(context, Future_Layout());},
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
                      onPressed: () {
                        NavigatewithAnimate(context, SignUp());
                      },
                      child: Text(
                        ' حساب جديد',
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: 16, color: HexColor('5271EE')),
                      )),
                  Text('ليس لديك اى حساب ؟ ',style: Theme.of(context).textTheme.headline3.copyWith(color: HexColor('000000'),fontSize: 16),)
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
