import 'package:diet_controller/cubit/food_cubit.dart';
import 'package:diet_controller/cubit/login_cubit.dart';
import 'package:diet_controller/presentation/components/custom_card.dart';
import 'package:diet_controller/presentation/components/custom_scaffold.dart';
import 'package:diet_controller/presentation/components/custom_text_montserrat.dart';
import 'package:diet_controller/presentation/components/fade_in_animation.dart';
import 'package:diet_controller/utils/route_constants.dart';
import 'package:diet_controller/utils/ui_constants.dart';
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
      Future.delayed(Duration(seconds: 2),()=>Navigator.of(context).pushReplacementNamed(KRoutes.dashboard)
      );
    }
    return CustomScaffold(
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children:[
                  Expanded(
                    child:CustomText("Não se esqueça de beber água!",textAlign: TextAlign.center,bold: true, color: Colors.white,fontSize: FontSize.huge,)
                  ),
                ]
              ),
              FadeInAnimation(Icon(Icons.anchor,size: MediaQuery.of(context).size.width/3,color: Colors.white,),curve: Curves.easeOutQuart,offsetBegin: Offset(0,-5),offsetEnd: Offset(0,2),rotationBegin: 0.03,)
            ],
          )
        ),
      )
    );
  }
}