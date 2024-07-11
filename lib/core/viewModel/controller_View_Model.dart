

import 'package:corsatech_app/core/view/pages/Favorite_View.dart';
import 'package:corsatech_app/core/view/pages/home_View.dart';
import 'package:corsatech_app/core/view/pages/personal_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class controllerViewModel extends GetxController {
  
  Widget get  currentScreen => _currentScreen  ; 
  Widget _currentScreen = HomeView() ; 
  get selectedValue => _selcetedValue ; 
  int _selcetedValue = 0  ; 
  get nvaigatorValue => _nvaigatorValue ;  
  int _nvaigatorValue = 2  ; 


  void changeSelctedValue (_selectedValue) {
       _nvaigatorValue = selectedValue ; 
        switch (_selectedValue) {
        case 0 : {
          _currentScreen = personalScreen() ; 
          break ; 
        } 
        case 1 : {
          _currentScreen = FavoriteView() ;
        }
        case 2 : {
          _currentScreen = HomeView()  ; 
        }
        case 2 : {
          _currentScreen = FavoriteView() ;
        }
        case 4 : {
          _currentScreen = FavoriteView() ; 
        }
      }

      update() ; 

  } 
 



}