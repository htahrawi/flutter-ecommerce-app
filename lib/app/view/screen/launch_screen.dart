import 'package:e_commerce_app/app/storage/shared_prefrenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if ( !SharedPrefController().getShowOutBourdingScreen() ) {
        Navigator.pushReplacementNamed(context, "/out_bording_screen");
      } else {
        if (SharedPrefController().getLogin()) {
          Navigator.pushReplacementNamed(context, "/home_screen");
        } else {
          Navigator.pushReplacementNamed(context, "/sign_in_screen");
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/Rectangle 9.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(54),
          child: Column(
            children: [
              SizedBox(height: 118,),
              Image.asset("asset/images/launch_name.png"),
              SizedBox(height: 20,),
              Text("FASHIONS", style: GoogleFonts.poppins(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                letterSpacing: 3,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
