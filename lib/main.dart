
import 'package:diet_controller/cubit/food_cubit.dart';
import 'package:diet_controller/cubit/login_cubit.dart';
import 'package:diet_controller/cubit/meal_cubit.dart';
import 'package:diet_controller/presentation/food/food_repository.dart';
import 'package:diet_controller/presentation/login/login_repository.dart';
import 'package:diet_controller/presentation/meal/meal_repository.dart';
import 'package:diet_controller/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(LoginRepository())),
        BlocProvider(create: (context) => FoodCubit(FoodRepository())),
        BlocProvider(create: (context)=> MealCubit(MealRepository())),        
      ], 
      child: MaterialApp(
        title: 'Diet Controller',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouterState.generateRoute,
      )
    );
  }
}
