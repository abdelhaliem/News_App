abstract class NewsStates {}

class NewsInitialState extends NewsStates {}
class NewsButtonNavState extends NewsStates {}

// start state Tab Bar
class NewsBusinessSuccessState extends NewsStates{}
class NewsBusinessErrorState extends NewsStates{
  final String error;
  NewsBusinessErrorState(this.error);
}
class NewsBusinessLoadingState extends NewsStates{}

class NewsSportsSuccessState extends NewsStates{}
class NewsSportsErrorState extends NewsStates{
  final String error;
  NewsSportsErrorState(this.error);
}
class NewsSportsLoadingState extends NewsStates{}

class NewsScienceLoadingState extends NewsStates{}
class NewsScienceSuccessState extends NewsStates{}
class NewsScienceErrorState extends NewsStates{
  final String error;
  NewsScienceErrorState(this.error);
}

class NewsTechnologyLoadingState extends NewsStates{}
class NewsTechnologySuccessState extends NewsStates{}
class NewsTechnologyErrorState extends NewsStates{
  final String error;
  NewsTechnologyErrorState(this.error);
}
class NewsEntertainmentLoadingState extends NewsStates{}
class NewsEntertainmentSuccessState extends NewsStates{}
class NewsEntertainmentErrorState extends NewsStates{
  final String error;
  NewsEntertainmentErrorState(this.error);
}

class NewsHealthLoadingState extends NewsStates{}
class NewsHealthSuccessState extends NewsStates{}
class NewsHealthErrorState extends NewsStates{
  final String error;
  NewsHealthErrorState(this.error);
}

// end state Tab Bar

class NewsSearchSuccessState extends NewsStates{}
class NewsSearchErrorState extends NewsStates{
  final String error;
  NewsSearchErrorState(this.error);
}
class NewsSearchLoadingState extends NewsStates{}
