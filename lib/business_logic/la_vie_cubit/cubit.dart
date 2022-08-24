
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/business_logic/la_vie_cubit/states.dart';

import 'package:la_vie/data/models/plants_model.dart';
import 'package:la_vie/data/models/product_model.dart';
import 'package:la_vie/data/models/tools_model.dart';
import 'package:la_vie/data/web_services/dio_helper.dart';
import 'package:la_vie/data/web_services/end_points.dart';
import 'package:la_vie/presentation/screens/home_screen.dart';
import 'package:la_vie/presentation/screens/leave_screen.dart';
import 'package:la_vie/presentation/screens/notification_screen.dart';
import 'package:la_vie/presentation/screens/profile_screen.dart';
import 'package:la_vie/presentation/screens/qr_code_scanner_screen.dart';

import '../../constants/constants.dart';
import '../../data/models/seeds_model.dart';
import '../../data/models/user_model.dart';
import '../../data/repository/cache_helper.dart';

class LaVieCubit extends Cubit<LaVieStates>{
  LaVieCubit() : super(LaVieInitialState());

  static LaVieCubit get(context) => BlocProvider.of(context);

  int currentIndex =2;

  List<Widget> NavBarScreens = [
    LeavesScreen(),
    QrCodeScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void changeNavBarScreen(int index){

    currentIndex = index;
    emit(LaVieChangeNavBarState());
  }
  SeedsModel? seedsModel;
  PlantsModel? plantsModel;
  ToolsModel? toolsModel;
  ProductModel? productModel;
  UserModel? userModel;

  void getSeeds(){
    DioHelper.getData
      (
      url:SEEDS ,
      token:CacheHelper.getData(key: SharedKeys.token,
    ).then((value) {

      seedsModel=SeedsModel.fromJson(value.data);
        print(value.data);
      emit(LaVieSuccessSeedsDataState());
    }).catchError((error){
      print(error.toString());
      emit(LaVieErrorSeedsDataState());
    }));
  }
  void getPlants(){
    DioHelper.getData
      (
      url:PLANTS ,
      token:CacheHelper.getData(key: SharedKeys.token,
    ).then((value) {

      plantsModel=PlantsModel.fromJson(value.data);
        print(value.data);
      emit(LaVieSuccessPlantsDataState());
    }).catchError((error){
      print(error.toString());
      emit(LaVieErrorPlantsDataState());
    }));
  }

  void getTools(){
    DioHelper.getData
      (
      url:TOOLS ,
      token:CacheHelper.getData(key: SharedKeys.token,
    ).then((value) {

      toolsModel=ToolsModel.fromJson(value.data);
      print(value.data);
      emit(LaVieSuccessToolsDataState());
    }).catchError((error){
      print(error.toString());
      emit(LaVieErrorToolsDataState());
    }));
  }

  void getProduct(){
    DioHelper.getData
      (
      url:PRODUCT ,
      token:CacheHelper.getData(key: SharedKeys.token,
    ).then((value) {

      productModel=ProductModel.fromJson(value.data);
      print(value.data);
      emit(LaVieSuccessProductDataState());
    }).catchError((error){
      print(error.toString());
      emit(LaVieErrorProductDataState());
    }));
  }
  void getCurrentUser(){
    emit(LaVieLoadingUserDataState());
    DioHelper.getData(
        url: CURRENT_USER,
        token: CacheHelper.getData(key: SharedKeys.token)
    ).then((value) {
      print(value.data);
      userModel = UserModel.fromJson(value.data);
      print(userModel!.message.toString());
      emit(LaVieSuccessUserDataState());
    }).catchError((error){
      print(error.toString());
      emit(LaVieErrorUserDataState());
    });


  }
}



