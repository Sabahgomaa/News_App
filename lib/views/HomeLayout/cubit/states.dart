abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeBottomNavState extends HomeStates {}

class ScienceInitialState extends HomeStates {}

class ScienceLoadingState extends HomeStates {}

class ScienceSuccessState extends HomeStates {}

class ScienceErrorState extends HomeStates {
  final String error;

  ScienceErrorState(this.error);
}

class SportsInitialState extends HomeStates {}

class SportsLoadingState extends HomeStates {}

class SportsSuccessState extends HomeStates {}

class SportsErrorState extends HomeStates {
  final String error;

  SportsErrorState(this.error);
}

class BusinessInitialState extends HomeStates {}

class BusinessLoadingState extends HomeStates {}

class BusinessSucessState extends HomeStates {}

class BusinessErrorState extends HomeStates {
  final String error;

  BusinessErrorState(this.error);
}
