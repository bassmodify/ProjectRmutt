import 'package:application_project/widget/contactus.dart';
import 'package:application_project/widget/editprofile.dart';
import 'package:application_project/widget/enroll.dart';
import 'package:application_project/widget/forgot.dart';
import 'package:application_project/widget/login.dart';
import 'package:application_project/widget/menu.dart';
import 'package:application_project/widget/profile.dart';
import 'package:application_project/widget/regiter.dart';
import 'package:application_project/widget/schedule.dart';
import 'package:application_project/widget/studentregistration.dart';
import 'package:application_project/widget/studentregistration1.dart';
import 'package:application_project/widget/text.dart';
import 'package:application_project/widget/text2.dart';
import 'package:application_project/widget/uploadapplicationdocuments.dart';
import 'package:application_project/widget/uploadregistrationdocuments.dart';
import 'package:flutter/material.dart';



final Map<String, WidgetBuilder> routes = {
  '/login':(BuildContext context)=> Login(),
  '/register':(BuildContext context)=>Regiter(),
  '/enroll':(BuildContext context)=>Enroll(),
  '/forgot':(BuildContext context)=>Forgot(),
  '/menu':(BuildContext context)=>Menu(),
  '/contactus':(BuildContext context)=>Contactus(),
  '/schedule':(BuildContext context)=>Schedule(),
  '/profile':(BuildContext context)=>Profile(),
  '/editprofile':(BuildContext context)=>EditProfile(),
  '/text2':(BuildContext context)=>Text2(),
  '/text':(BuildContext context)=>Schedule1(),
  '/studentregistration':(BuildContext context)=>StudentRegistration(),
  '/studentregistration1':(BuildContext context)=>Studentregistration1(),
  '/uploadapplicationdocuments':(BuildContext context)=>Uploadapplicationdocuments(),
  '/uploadregistrationdocuments':(BuildContext context)=>Uploadregistrationdocuments(),



};