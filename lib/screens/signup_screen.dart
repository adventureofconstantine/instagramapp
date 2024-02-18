import 'dart:typed_data';

import'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramapp/resources/auth_methods.dart';
import 'package:instagramapp/utils/utils.dart';
import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _bioController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage()async{
 Uint8List im= await pickImage(ImageSource.gallery);
 setState(() {
_image=im;
 });
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
            Stack(children: [_image!=null? CircleAvatar(radius: 64,backgroundImage: MemoryImage(_image!),):const CircleAvatar(radius: 64,backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Windows_10_Default_Profile_Picture.svg/768px-Windows_10_Default_Profile_Picture.svg.png?20221210150350'),),
              Positioned(bottom:-10,left:80,child: IconButton(onPressed: selectImage,icon:Icon(Icons.add_a_photo) ,))],),
            const SizedBox(height:30),
            TextFieldInput(hintText:'Enter your username',textInputType:TextInputType.text,
              textEditingController:_usernameController,),
            //text field input for username
            const SizedBox(height:20),
            TextFieldInput(hintText:'Enter your email',textInputType:TextInputType.emailAddress,
              textEditingController:_emailController,),
            const SizedBox(height:20),
            TextFieldInput(hintText:'Enter your bio',textInputType:TextInputType.text,
              textEditingController:_bioController,),
            const SizedBox(height:20),
            TextFieldInput(hintText:'Enter your Password',textInputType:TextInputType.text,
              textEditingController:_passwordController,
              isPass: true,
            ),
            const SizedBox(height:20),
            InkWell(
              onTap: ()async{
                AuthMethods().signUpUser(email: _emailController.text, password:_passwordController.text, username: _usernameController.text, bio: _bioController.text,file: _image!);//,file: _image!
              },
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
