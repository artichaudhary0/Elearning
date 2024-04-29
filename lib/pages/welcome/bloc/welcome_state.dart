class WelcomeState {
  int page;
  WelcomeState({ this.page=0});
}

class InitWelcomeState extends WelcomeState {
  InitWelcomeState() : super(page: 0);
}
