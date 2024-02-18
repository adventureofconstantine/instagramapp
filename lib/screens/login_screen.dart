import'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramapp/utils/colors.dart';
import 'package:instagramapp/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child:Container(
        padding:const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          children:[
            Flexible(child:  Container(),flex: 2,),
          SvgPicture.asset('assets/ic_instagram.svg',color:primaryColor,height:64),
            const SizedBox(height:64),
            TextFieldInput(hintText:'Enter your email',textInputType:TextInputType.emailAddress,
            textEditingController:_emailController,),
            const SizedBox(height:20),
            TextFieldInput(hintText:'Enter your Password',textInputType:TextInputType.text,
              textEditingController:_passwordController,
              isPass: true,
            ),
            const SizedBox(height:20),
            InkWell(
              onTap: (){},
              child: Container(child:const Text('Log in'),
              alignment: Alignment.center,
              width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical:16),
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),color:blueColor),),
            ),
            const SizedBox(height:14),
            Flexible(child: Container(),flex:2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: const Text("Don't have an account?"),padding: EdgeInsets.symmetric(vertical: 8),),
                GestureDetector(onTap:(){},child: Container(child: const Text("  Sign up.",style: TextStyle(fontWeight: FontWeight.bold),),padding: EdgeInsets.symmetric(vertical: 8),)),
              ],
            ),
        const SizedBox(height: 20,)
          ],
        ),

      ),),
    );
  }
}
