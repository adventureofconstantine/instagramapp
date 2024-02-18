import 'package:flutter/material.dart';
import 'package:instagramapp/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({super.key,required this.mobileScreenLayout,required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constrains){
      if(constrains.maxWidth>webScreenSize){
return webScreenLayout;
      }
      return mobileScreenLayout;
    });
  }
}
