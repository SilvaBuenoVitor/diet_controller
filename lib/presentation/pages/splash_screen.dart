import 'package:diet_controller/cubit/food_cubit.dart';
import 'package:diet_controller/cubit/login_cubit.dart';
import 'package:diet_controller/presentation/components/custom_card.dart';
import 'package:diet_controller/presentation/components/custom_text_montserrat.dart';
import 'package:diet_controller/utils/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loadingFoodCards = true;
  
  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initApp() async{
    await context.read<FoodCubit>().getFood(context.read<LoginCubit>().id);
    setState(() {
      _loadingFoodCards = false;
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    if (!_loadingFoodCards) {
      Future.delayed(Duration(seconds: 1),()=>Navigator.of(context).pushReplacementNamed(KRoutes.dashboard)
      );
    }
    return Scaffold(
      body: Center(
        child: CustomCard(
          child: CustomText("Carregando mano"),
        ),
      ),
    );
  }
}