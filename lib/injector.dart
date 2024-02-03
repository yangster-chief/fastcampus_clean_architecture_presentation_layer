import 'package:clean_architecture_layer_exam/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam
/// File Name: injector
/// Created by sujangmac
///
/// Description:
///
final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => locator.init();
