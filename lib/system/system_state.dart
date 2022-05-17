class SystemState {
  String name = "";
  String kernelVersion = "";
  String longOsVresion = "";
  String osVersion = "";
  String hostname = "";
  int uptime = 0;
  int boottime = 0;
  LoadAverage loadAverage = const LoadAverage();
}

class LoadAverage {
  final double oneMinute;
  final double fiveMinutes;
  final double fifteenMinutes;

  const LoadAverage(
      {this.oneMinute = 0, this.fiveMinutes = 0, this.fifteenMinutes = 0});
}
