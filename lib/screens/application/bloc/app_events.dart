abstract class AppEvents {
  const AppEvents();
}

class TrigerAppEvents extends AppEvents {
  final int index;

  const TrigerAppEvents(this.index) : super();
}
