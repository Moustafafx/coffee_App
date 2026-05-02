part of 'drinkes_cubit.dart';

@immutable
sealed class DrinkesState {}

final class DrinkesInitial extends DrinkesState {}
final class Drinkessuccess extends DrinkesState {
 
  final List <ModelsDrinks>drinks;

  Drinkessuccess(this.drinks);

}
final class Drinkesloading extends DrinkesState {}
final class Drinkeserror extends DrinkesState {
 final String error;

  Drinkeserror({required this.error});

}
