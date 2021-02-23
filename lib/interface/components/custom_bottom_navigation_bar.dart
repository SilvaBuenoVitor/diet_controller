import 'package:diet_controller/utils/route_constants.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int _selectedIndex;
  final BuildContext context;
  const CustomBottomNavigationBar(this._selectedIndex, this.context);  

  void _onTap(int index){
    if(index == _selectedIndex)
      return;
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, KRoutes.mealScreen);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, KRoutes.dashboard);
        break;
      default:
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white,width: 0.1))
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(color: UIColors.primaryLight,size: 40),
        selectedLabelStyle: TextStyle(color: Colors.white10),
        selectedItemColor: Colors.white,
        unselectedItemColor: UIColors.primaryDark,
        elevation: 0,
        backgroundColor: UIColors.transparent,
        onTap: _onTap,
        items: [
          //icon room service could be used
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu),label: "Refeições"),
          BottomNavigationBarItem(icon: Icon(Icons.anchor),label: "Rotinas"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Eventos"),
        ]
      ),
    );
  }
}