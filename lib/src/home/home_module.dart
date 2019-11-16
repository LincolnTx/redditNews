import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:redditnews/src/app/app_module.dart';
import 'package:redditnews/src/shared/custom_dio/custom_dio.dart';

import 'home_bloc.dart';
import 'home_gateway.dart';
import 'home_page.dart';


class HomeModule extends ModuleWidget{
  
  @override
  List<Bloc> get blocs => [
    Bloc ((injectionBloc) => HomeBloc(HomeModule.to.getDependency<HomeGateway>()))
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency(
      (injectDependecy) => HomeGateway(AppModule.to.getDependency<CustomDio>())
    )
  ];

  @override
  Widget get view => MyHomePage();

  static Inject get to => Inject<HomeModule>.of();
}