abstract class NewsStates {}
class NewInitialState extends NewsStates{}
class NewBottomNavState extends NewsStates{}

class NewGetBusinessLoadingState extends NewsStates{}
class NewGetBusinessSuccessState extends NewsStates{}
class NewGetBusinessErrorState extends NewsStates{
  final String error;
  NewGetBusinessErrorState(this.error);
}

class NewGetScienceLoadingState extends NewsStates{}
class NewGetScienceSuccessState extends NewsStates{}
class NewGetScienceErrorState extends NewsStates{
  final String error;
  NewGetScienceErrorState(this.error);
}

class NewGetSportsLoadingState extends NewsStates{}
class NewGetSportsSuccessState extends NewsStates{}
class NewGetSportsErrorState extends NewsStates{
  final String error;
  NewGetSportsErrorState(this.error);
}

class NewGetSearchLoadingState extends NewsStates{}
class NewGetSearchSuccessState extends NewsStates{}
class NewGetSearchErrorState extends NewsStates{
  final String error;
  NewGetSearchErrorState(this.error);
}
