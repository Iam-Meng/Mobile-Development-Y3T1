class MyDuration {
  final int _milliseconds;
  MyDuration.milliseconds(this._milliseconds) {
    if (_milliseconds < 0)
      throw ArgumentError("The Duration shall always greater or equal to 0");
  }
  MyDuration.fromSeconds(int seconds) : this.milliseconds(seconds * 1000);
  MyDuration.fromMinutes(int minutes) : this.milliseconds(minutes * 60000);
  MyDuration.fromHours(int hours) : this.milliseconds(hours * 3600000);

  int get fromSeconds => this._milliseconds ~/ 1000;
  int get fromMinutes => this._milliseconds ~/ 60000;
  int get fromHours => this._milliseconds ~/ 3600000;

  MyDuration operator +(MyDuration other) {
    return MyDuration.milliseconds(this._milliseconds + other._milliseconds);
  }

  bool operator >(MyDuration other) => this._milliseconds > other._milliseconds;

  MyDuration operator -(MyDuration other) {
    if (this._milliseconds > other._milliseconds) {
      return MyDuration.milliseconds(this._milliseconds - other._milliseconds);
    } else if (this._milliseconds == other._milliseconds) {
      return MyDuration.milliseconds(this._milliseconds - other._milliseconds);
    } else
      throw ArgumentError("Duration cannot be negative");
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
