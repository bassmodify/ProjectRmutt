import 'package:application_project/widget/contactus.dart';
import 'package:application_project/widget/forgot.dart';
import 'package:application_project/widget/login.dart';
import 'package:application_project/widget/menu.dart';
import 'package:application_project/widget/profile.dart';
import 'package:application_project/widget/regiter.dart';
import 'package:application_project/widget/regiter1.dart';
import 'package:application_project/widget/regiter2.dart';
import 'package:application_project/widget/regiter3.dart';
import 'package:application_project/widget/schedule.dart';
import 'package:application_project/widget/studentregistration.dart';
import 'package:application_project/widget/text.dart';
import 'package:flutter/material.dart';


final Map<String, WidgetBuilder> routes = {
  '/login':(BuildContext context)=> Login(),
  '/register':(BuildContext context)=>Regiter(),
  '/register1':(BuildContext context)=>Regiter1(),
  '/register2':(BuildContext context)=>Regiter2(),
  '/register3':(BuildContext context)=>Regiter3(),
  '/forgot':(BuildContext context)=>Forgot(),
  '/menu':(BuildContext context)=>Menu(),
  '/contactus':(BuildContext context)=>Contactus(),
  '/schedule':(BuildContext context)=>Schedule(),
  '/profile':(BuildContext context)=>Profile(),
  '/studentregistration':(BuildContext context)=>StudentRegistration(),
  '/text':(BuildContext context)=>Text1(),


};