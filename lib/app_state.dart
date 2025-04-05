class AppState {
  int counter;
  AppState({required this.counter});
}

class InitalState extends AppState {
  InitalState() : super(counter: 0);
}
