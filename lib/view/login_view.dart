import 'package:flutter/material.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/Utils/utils.dart';

import '../res/componets/round_button.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool>_obsecurepassword= ValueNotifier<bool>(false);
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();


  FocusNode emailFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();


 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _obsecurepassword.dispose();
    _emailController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
               keyboardType:TextInputType.emailAddress,
              focusNode: emailFocus,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email_outlined),

              ),
              onFieldSubmitted:(value){
                Utils.fieldFocusChange(context, emailFocus, passwordFocus);
              } ,


            ),


            ValueListenableBuilder(valueListenable: _obsecurepassword, builder: (context,value,child){
              return  TextFormField(

                controller: _passwordController,
                obscureText: _obsecurepassword.value,
                focusNode: passwordFocus,
                obscuringCharacter: "*",

                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open_outlined),
                  suffixIcon: InkWell(
                      onTap: (){
                     _obsecurepassword.value=!_obsecurepassword.value;
                      },
                    child: Icon(  _obsecurepassword.value ?Icons.visibility_off_outlined:Icons.visibility),
                  ),


                ),

              );
            }
            ),
            SizedBox(height: height*.1,),
            RoundButton(
              title: 'Login',
              onpress: (){

                if(_emailController.text.isEmpty){
                   Utils.flushBarErrorMessage('Please Enter  Email',context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter  Password',context);

                }else if(_passwordController.text.length<6){
                  Utils.flushBarErrorMessage('Please Enter  6 Digit Password',context);

                }else{
                   print ('api hit');
                }
              },
            ),


          ],
        ),
      )
    );
  }
}

// Center(
// child: InkWell(
// onTap: (){
// // Navigator.pushNamed(context ,RoutesName.home);
// Utils.flushBarErrorMessage("no INTERNET Connection", context);
// Utils.toastMassage('hello babies');
// Utils.snackBar('my work cary on', context);
// },
// child: Text("Click")
// ),
// )