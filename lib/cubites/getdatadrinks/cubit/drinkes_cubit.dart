import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/models/models_drinks.dart';
import 'package:meta/meta.dart';

part 'drinkes_state.dart';

class DrinkesCubit extends Cubit<DrinkesState> {
 final Dio dio;
  DrinkesCubit(this.dio) : super(DrinkesInitial());



Future<void>getdrinks(String endpoint) async{

try {
   emit(Drinkesloading());
     print("loading...");
  final response=await dio.get("https://api.sampleapis.com/coffee/$endpoint");
  print(response.data);
 final List<ModelsDrinks>drinks=(response.data as List).map((e) => ModelsDrinks.fromjson(e)).toList();

 emit(Drinkessuccess(drinks));
}  catch (e) {
  emit(Drinkeserror(error:e.toString()));
}
 

 }

}
