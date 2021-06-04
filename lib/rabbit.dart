class Rabbit {
  String _name;
  RabbitState _state;
  Rabbit(this._name, this._state);
  get name => _name;
  get state => _state;

  updateState(RabbitState state) {
    this._state = state;
  }
}

enum RabbitState { SLEEP, RUN, WALK, EAT }
