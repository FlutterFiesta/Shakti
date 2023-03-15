// import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:power_she_pre/screens/Safety/mainScreen.dart';
import 'package:power_she_pre/screens/Safety/contactPage.dart';

import 'package:power_she_pre/constants.dart';
// import 'package:power_she_pre/safety/contactPage.dart';
import 'package:power_she_pre/screens/ChatBotSupport/mainScreen.dart';
import 'package:power_she_pre/screens/Tracker/TrackerInfo.dart';
import 'package:power_she_pre/screens/Tracker/TrackerPage.dart';
import 'package:power_she_pre/screens/gender_auth/selfie_upload.dart';
import 'package:power_she_pre/screens/group_chat/chat_page.dart';
import 'package:power_she_pre/screens/group_chat/groupsHomeScreen.dart';
import 'package:power_she_pre/screens/group_chat/searchScreen.dart';
import 'package:power_she_pre/screens/helper/helper_function.dart';
import 'package:power_she_pre/screens/seller_buyer/my_products.dart';
import 'package:power_she_pre/screens/seller_buyer/new_product.dart';
import 'package:power_she_pre/screens/onboard/onboardScreen.dart';
import 'package:power_she_pre/screens/map/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:power_she_pre/screens/course.dart';
import 'package:power_she_pre/screens/home_screen.dart';

import 'package:power_she_pre/screens/seller_buyer/orders.dart';
import 'package:power_she_pre/screens/safety_screen.dart';
import 'package:power_she_pre/screens/splash.dart';
import 'package:power_she_pre/screens/authentication/login.dart';
import 'package:power_she_pre/screens/authentication/registration.dart';
import 'package:power_she_pre/screens/seller_buyer/store.dart';
import 'package:power_she_pre/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_she_pre/screens/opr_screen.dart';
import 'package:power_she_pre/screens/phone_details.dart';
import 'package:power_she_pre/screens/user_profile.dart';
import 'package:power_she_pre/screens/safety_screen.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // LocalNotificationService.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
      home: _isSignedIn ? const HomeScreen() : const SplashScreen(),
      theme: ThemeData(
        primaryColor: kpink,
        scaffoldBackgroundColor: kbase,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        OnboardScreen.id: (context) => const OnboardScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegisterationScreen.id: (context) => RegisterationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        Course.id: (context) => const Course(),
        OprScreen.id: (context) => const OprScreen(),
        SelfieUpload.id: (context) => const SelfieUpload(),
        StoreScreen.id: (context) => const StoreScreen(),
        OrderScreen.id: (context) => const OrderScreen(),
        OprScreen.id: (context) => const OprScreen(),
        SafetyScreen.id: (context) => const SafetyScreen(),
        PhoneDetails.id: (context) => const PhoneDetails(),
        MyProducts.id: (context) => const MyProducts(),
        NewProduct.id: (context) => const NewProduct(),
        UserProfile.id: (context) => const UserProfile(),
        Location.id: (context) => const Location(),
        mainChatScreen.id: (context) => const mainChatScreen(),
        groupsHome.id: (context) => const groupsHome(),
        SearchPage.id: (context) => const SearchPage(),
        TrackerPage.id:(context)=>const TrackerPage(),
        TrackerInfo.id:(context)=>const TrackerInfo(),
        AddContactsPage.id: (context) => const AddContactsPage(),
        ContactsPage.id: (context) => const ContactsPage()
        // TrackerInfo.id:(context)=>const TrackerInfo()
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//     return
