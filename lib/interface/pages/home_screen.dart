
import 'package:diet_controller/cubit/food_cubit.dart';
import 'package:diet_controller/interface/components/custom_bottom_navigation_bar.dart';
import 'package:diet_controller/interface/components/custom_scaffold.dart';
import 'package:diet_controller/interface/components/custom_text_montserrat.dart';
import 'package:diet_controller/interface/widgets/food_card.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //main app screen
  @override
  Widget build(BuildContext context) {
    //willPopScope for pop treatment, implement log out here as well
    return WillPopScope(
      child: CustomScaffold(
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Spacing.normal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //foodCubit consumer, will be replaced
                BlocConsumer<FoodCubit, FoodState>(
                 builder: (context, state){
                   if(state is FoodInitial){
                     return CircularProgressIndicator();
                   } else if(state is FoodLoaded){
                     return FoodCard(state.food);
                   } 
                    return Container();
                 }, 
                 listener: (context, state){
                   if(state is FoodError){
                     Scaffold.of(context).showSnackBar(SnackBar(content: CustomText("Erro ao buscar alimentos, a internet está ativa?")));
                   }
                 }
                ),
              ],
            ),
          )
        ),
        bottomNavigationBar: CustomBottomNavigationBar(1,context),
      ),
      onWillPop: _onWillPop
    ); 
  }

  //pop treatment
  Future<bool> _onWillPop() async{
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: CustomText("Tem certeza?"),
        content: CustomText("Deseja sair do aplicativo?"),
        actions: [
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Não'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Sim'),
          ),
        ],
      )
      )
    ) ?? false;
  } 
  

  @override
  void dispose() {
    super.dispose();
  }
}